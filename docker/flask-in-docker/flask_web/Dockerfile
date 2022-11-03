FROM ubuntu:16.04

MAINTAINER John Trammell "john.trammell@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -v -r requirements.txt --index-url https://binrepo.target.com/artifactory/api/pypi/pypi-remote/simple

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
