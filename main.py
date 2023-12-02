from flask import Flask
from route.routes import myWeb
from dotenv import dotenv_values as env
from flask_login import LoginManager
from models.model import db

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = env(".env")["DATABASE_STRING"]      #   'postgresql://postgres:12345@localhost/cake_db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db.init_app(app)

with app.app_context():
    db.create_all()

app.config["SECRET_KEY"] = env(".env")["SECRET_KEY"]
app.register_blueprint(myWeb)
	

if __name__ == "__main__":
	app.run(debug=True,port=5000)