FROM ubuntu
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
COPY manage.py /code/
COPY simpleApp /code
RUN apt-get update -qq
RUN apt-get -y install python3.6
RUN apt-get -qqy install python3-pip
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
CMD python3.6 manage.py runserver 0.0.0.0:8000



