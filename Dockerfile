FROM python:3.8-alpine

EXPOSE 3000/tcp


COPY . /app
WORKDIR /app

RUN pip install -r requirements.txt
RUN pip install requests

ENTRYPOINT [ "python" ]

CMD ["movies.py" ]
