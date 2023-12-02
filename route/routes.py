from flask import Blueprint,render_template,request, jsonify, redirect, url_for, session, flash
myWeb  = Blueprint("app",__name__)
from models.model import db, CakeDetails, Message, User


@myWeb.route("/")
def home():
    if not "user_id" in session:
        return redirect(url_for('app.login'))
    

    products = [
            {
                'id': cake.id,
                'cake_name': cake.cake_name,
                'cake_image': cake.cake_image,
                'cake_description': cake.cake_description
            }
            for cake in CakeDetails.query.all()
        ]
    
    

    return render_template("index.html", products = products[:6])
	

@myWeb.route("/about")
def about():
	return render_template("about.html")


@myWeb.route("/contact",methods=["GET","POST"])
def contact():
    msg = session.pop('msg', None)
    if msg is not None:
        return render_template("contact.html",msg=msg)
    else:
        return render_template("contact.html")
          


@myWeb.route("/services")
def services():
	return render_template("services.html")
	

@myWeb.route("/portfolio")
def portfolio():
     
    products = [
            {
                'id': cake.id,
                'cake_name': cake.cake_name,
                'cake_image': cake.cake_image,
                'cake_description': cake.cake_description
            }
            for cake in CakeDetails.query.all()
        ]
        

    return render_template("portfolio.html", products = products)

@myWeb.route("/single_product/<int:product_id>")
def single_product(product_id):
	cake_details = CakeDetails.query.get_or_404(product_id)

	return render_template("single-project.html", cake=cake_details)


@myWeb.route('/add_cake', methods=[ 'POST'])
def add_cake():

    if request.method == 'POST':
        cake_name = request.form.get('cake_name')
        cake_image = request.files['cake_image']
        cake_description = request.form.get('cake_description')
        if not (cake_name and cake_image and cake_description):
            session['cake_msg'] = 'All fields are required'
        else:
            cake_image_name = cake_image.filename
            cake_image.save('static/img/' + cake_image_name)
            print(f"File '{cake_image_name}' uploaded successfully.")

            new_cake = CakeDetails(cake_name=cake_name, cake_image=cake_image_name, cake_description=cake_description)
            db.session.add(new_cake)
            db.session.commit()

            session['cake_msg'] = f"The Product '{cake_name}' added successfully!"
        
        return redirect(url_for('app.manage_products'))



@myWeb.route('/cake/<int:cake_id>', methods=['PUT'])
def update_cake(cake_id):
    
    cake = CakeDetails.query.get_or_404(cake_id)

    cake.cake_name = request.form.get('cake_name')
    cake.cake_image = request.form.get('cake_image')
    cake.cake_description = request.form.get('cake_description')

    db.session.commit()

    return jsonify({'message': 'Cake updated successfully', 'cake_id': cake.id}), 200


# for contact messages
@myWeb.route('/messages', methods=['GET', 'POST'])
def add_message():
    if request.method == 'POST':
        user_name = request.form.get('user_name')
        email = request.form.get('email')
        subject = request.form.get('subject')
        message_text = request.form.get('message')

        if not (user_name and email and subject and message_text):
            msg = 'Missing required fields'
        else:
            new_message = Message(user_name=user_name, email=email, subject=subject, message=message_text)
            db.session.add(new_message)
            db.session.commit()
            msg = "Message successfully sent!"

        session['msg']  = msg

        return redirect(url_for('app.contact'))
    else:
        messages = Message.query.all()

    messages_data = [
        {
            'id': message.id,
            'user_name': message.user_name,
            'email': message.email,
            'subject': message.subject,
            'message': message.message
        }
        for message in messages
    ]

    return jsonify({'messages': messages_data})  


# register
@myWeb.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')

        if not (username and password and email):
            return render_template('login.html', class_f= 'right-panel-active', display_sign_up = 'Username, email and password are required')

        existing_user = User.query.filter_by(email=email).first()

        if existing_user:
            flash('Email already exists. Choose a different one.', 'error')
            return render_template('login.html', class_f= 'right-panel-active', display_sign_up = 'Email Already Registered')

        new_user = User(username=username, email=email)
        new_user.set_password(password)

        db.session.add(new_user)
        db.session.commit()

        flash('Account created successfully. You can now log in.', 'success')
        return redirect(url_for('app.login'))

    return render_template('login.html', class_f= 'right-panel-active')

@myWeb.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')

        user = User.query.filter_by(email=email).first()

        if user and user.check_password(password):
            session['user_id'] = user.id
            flash('Login successful!', 'success')
            return redirect(url_for('app.home'))
        else:
            return render_template('login.html', display_sign_in='Incorrect Email or Password')

    return render_template('login.html')

@myWeb.route('/logout')
def logout():
    session.pop('user_id', None)
    flash('Logged out successfully.', 'success')
    return redirect(url_for('app.login'))


@myWeb.route('/manage_products')
def manage_products():

    msg = session.pop('cake_msg', '')
    msg2 = session.pop('cake_delete', '')
    products = [
            {
                'id': cake.id,
                'cake_name': cake.cake_name,
                'cake_image': cake.cake_image,
                'cake_description': cake.cake_description
            }
            for cake in CakeDetails.query.all()
        ]
    

    return render_template('manage_product.html', products = products,  msg = msg, msg2=msg2)


@myWeb.route('/product_delete', methods=['POST'])
def product_delete():
    msg = ''
    if request.method == 'POST':
        delete_id = request.form['product_id']

        cake = CakeDetails.query.get(delete_id)

        db.session.delete(cake)
        db.session.commit()

        msg = f'Cake "{cake.cake_name}" deleted successfully.'

        
        session['cake_delete'] = msg
        
        return redirect(url_for('app.manage_products'))


    

