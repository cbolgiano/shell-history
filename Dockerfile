FROM python:3-alpine

RUN mkdir -p /app/certs
WORKDIR /app

RUN apk add --no-cache python-dev gcc build-base

COPY requirements.txt requirements.txt

RUN pip install -r requirements.txt


COPY certs/* /app/certs/
COPY backend/* /app/

ENV PORT 50051

EXPOSE 80
EXPOSE 50051

CMD  python server.py & python manage.py runserver 0.0.0.0:80
