FROM python:3.7.3-stretch

COPY requirements.txt /tmp/

RUN pip3 install -r /tmp/requirements.txt

RUN useradd --create-home appuser

WORKDIR /home/appuser

USER appuser

COPY app.py /opt/

ENTRYPOINT FLASK_APP=/opt/app.py flask run --host=0.0.0.0 --port=8080

CMD [ "python", "/opt/app.py"]