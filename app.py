from flask import Flask
from route.routes import myWeb
from dotenv import dotenv_values as env
from flask_login import LoginManager
from models.model import db

app = Flask(__name__)
app.config.from_object('config')  # Load configuration from config.py


db.init_app(app)

with app.app_context():
    db.create_all()

app.register_blueprint(myWeb)
	

if __name__ == "__main__":
	app.run(debug=True,port=8080)