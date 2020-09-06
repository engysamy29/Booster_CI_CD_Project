FROM ubuntu:16.04

RUN apt-get update -qq
RUN apt-get install -y software-properties-common && \
  add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update -qq

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel
ADD . /simpleApp
WORKDIR /simpleApp
COPY . .
RUN apt-get update -qq
EXPOSE 8000
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]


