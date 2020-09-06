FROM python:3.6-buster
RUN mkdir /code
WORKDIR /code
COPY requirements.txt requirements.txt
COPY manage.py manage.py
COPY simpleApp /code
RUN apt-get update -qq
RUN apt-get -y install python3.6
RUN apt-get -qqy install python3-pip
EXPOSE 8000
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]



