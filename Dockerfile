FROM ubuntu

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git

# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel

RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
COPY manage.py /code/
COPY simpleApp /code
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
CMD python3.6 manage.py runserver 0.0.0.0:8000



