FROM ubuntu:latest


RUN apt-get --yes --force-yes  install unzip curl
RUN ["/bin/bash", "-c", "curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh"]
RUN ["/bin/bash", "-c", "source ~/.dnx/dnvm/dnvm.sh"]
RUN apt-get --yes --force-yes  install libunwind8 gettext libssl-dev libcurl3-dev zlib1g libicu-dev
RUN dnvm upgrade -r coreclr



COPY . /app
WORKDIR /app
RUN ["dnu", "restore"]

EXPOSE 5000
ENTRYPOINT ["dnx", "-p", "project.json", "web"]



