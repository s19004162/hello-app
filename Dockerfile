FROM python:3.7.3-stretch

COPY requirements.txt /tmp/

RUN pip3 install -r /tmp/requirements.txt

RUN useradd --create-home appuser

WORKDIR /home/appuser

USER appuser

COPY app.py /home/appuser

ENTRYPOINT FLASK_APP=/home/appuser/app.py flask run --host=0.0.0.0 --port=8080

CMD [ "python3", "/home/appuser/app.py"]