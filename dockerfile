FROM ubuntu:14.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository universe
RUN apt-get update && apt-get install -y \
    apache2 \
    curl \
    git \
    libapache2-mod-php5 \
    php5 \
    php5-mcrypt \
    php5-mysql \
    python3.4 \
    python-pip
  
ADD . /simpleApp
WORKDIR /simpleApp
COPY . .
RUN apt-get update -qq
EXPOSE 8000
RUN pip install --upgrade setuptools --user python  
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]


