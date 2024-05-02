FROM python:3.11

WORKDIR /app

ADD proto .
ADD python .

RUN python -m pip install -r requirements.txt

ENTRYPOINT [ "python", "./src/main.py" ]