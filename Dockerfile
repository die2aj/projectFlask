

FROM python:3.8-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . /app

EXPOSE 9000/tcp

ENTRYPOINT [ "python" ]

CMD ["main.py" ]