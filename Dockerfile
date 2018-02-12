FROM library/python:3.6-alpine3.7
VOLUME ["/Users/james/stone_ridge_python_kafka", "/src"]
WORKDIR /src
COPY requirements.txt /src/requirements.txt
RUN apk update && apk add python3-dev gcc musl-dev librdkafka librdkafka-dev && cd /src && \
    pip install -r requirements.txt

CMD [ "python", "/src/kafkatest/manage.py", "runserver", "0.0.0.0:8000" ]
