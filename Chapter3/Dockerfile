FROM python:3.8-slim-buster 
RUN apt-get update && apt-get install -y vim apache2-utils && rm -rf /var/lib/apt/lists/*
COPY . /app 
WORKDIR /app 
RUN pip3 install -r requirements.txt 
ENTRYPOINT ["python3"] 
CMD ["app.py"] 
EXPOSE 5000