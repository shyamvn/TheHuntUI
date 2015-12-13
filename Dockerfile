FROM microsoft/aspnet:latest

EXPOSE 5000  
ENTRYPOINT ["dnx", "-p", "project.json", "web"]

COPY . /app 
WORKDIR /app/src/UI  
RUN ["dnu", "restore"]  
