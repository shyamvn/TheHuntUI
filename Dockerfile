FROM microsoft/aspnet:latest

EXPOSE 5000  
ENTRYPOINT ["dnx", "-p", "project.json", "web"]

COPY . /app 
WORKDIR /app/src/UI
RUN apt-get update  
RUN apt-get upgrade 
RUN apt-get -y install  sqlite3 libsqlite3-dev 

RUN ["dnu", "restore"]  
