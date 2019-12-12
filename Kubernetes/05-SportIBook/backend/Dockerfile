FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
RUN sed -i 's/main/main contrib non-free/' /etc/apt/sources.list
RUN apt-get update && apt-get install -y mysql-client libpcre3 libpcre3-dev gettext
WORKDIR /code
COPY requirements.txt /code/
COPY utils-scripts/wait_and_start.sh /usr/local/bin/wait_and_start.sh
RUN chmod +x /usr/local/bin/wait_and_start.sh
COPY ./utils-scripts/uwsgi.ini /etc/uwsgi.ini
RUN pip install -r requirements.txt
COPY . /code/
VOLUME /var/log/uwsgi

