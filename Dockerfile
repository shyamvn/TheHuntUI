FROM microsoft/aspnet:latest

COPY . /app
WORKDIR /app
RUN ["dnu", "restore"]

EXPOSE 5000/tcp
ENTRYPOINT ["dnx", "-p", "src/ui/project.json", "web"]
