FROM library/python:3.6-alpine3.7
VOLUME ["/ABSOLUTE PATH TO CURRENT DIR DOCKERFILE IS IN", "/src"]
WORKDIR /src
COPY requirements.txt /src/requirements.txt
RUN apk update && apk add python3-dev gcc musl-dev librdkafka librdkafka-dev && cd /src && \
    pip install -r requirements.txt

CMD [ "python", "/src/kafkatest/manage.py", "runserver", "0.0.0.0:8000" ]
