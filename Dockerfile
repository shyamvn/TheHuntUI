FROM ubuntu:latest

RUN apt-get install unzip curl
RUN curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh
RUN sudo apt-get install libunwind8 gettext libssl-dev libcurl4-openssl-dev zlib1g libicu-dev uuid-dev
RUN dnvm upgrade -r coreclr



COPY . /app
WORKDIR /app
RUN ["dnu", "restore"]

EXPOSE 5000
ENTRYPOINT ["dnx", "-p", "project.json", "web"]



