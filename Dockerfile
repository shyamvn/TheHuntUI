FROM microsoft/aspnet:latest

EXPOSE 5000  
ENTRYPOINT ["dnx", "-p", "src/ui/project.json", "web"]

COPY . /app 
WORKDIR /app/src/ui  
RUN ["dnu", "restore"]  
