FROM ubuntu
RUN apt-get update -qq
RUN apt-get -y install python3.6
RUN apt-get -qqy install python3-pip
ADD . /simpleApp
WORKDIR /simpleApp
COPY . .
RUN apt-get update -qq
EXPOSE 8000
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]


