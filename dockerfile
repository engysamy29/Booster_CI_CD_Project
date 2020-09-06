FROM ubuntu:16.04
RUN sudo apt-get install software-properties-common

RUN sudo add-apt-repository ppa:jonathonf/python-3.6
RUN sudo apt-get update
RUN sudo apt-get install python3.6 libpython3.6

RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 2
RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN apt-get update -qq
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN pip --version
ADD . /simpleApp
WORKDIR /simpleApp
COPY . .
RUN apt-get update -qq
EXPOSE 8000
RUN pip install -r requirements.txt
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]


