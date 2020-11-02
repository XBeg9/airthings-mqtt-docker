FROM python:2.7

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install libglib2.0-dev bluez cron --yes

RUN pip install bluepy paho-mqtt tableprint

RUN mkdir /app

WORKDIR /app

COPY ./*.py ./

ENV SN=
ENV MQTT_SERVER=

COPY crontab.txt /etc/cron.d/crontab
COPY entrypoint.sh entrypoint.sh

RUN chmod +x entrypoint.sh

CMD ["/app/entrypoint.sh"]