

image:
	docker build -t flask-tutorial:latest .

startapp:
	FLASK_APP=app.py flask run

startcon:
	docker run -d -p 5000:5000 --name ftut flask-tutorial

stop:
	docker rm -f ftut
