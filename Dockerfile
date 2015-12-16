FROM debian:jessie

RUN apt-get --yes --force-yes  install unzip curl wget
RUN apt-get -qq update && apt-get -qqy install libunwind8 gettext libssl-dev libcurl4-openssl-dev zlib1g libicu-dev uuid-dev


RUN curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh
RUN bash -c "source .dnx/dnvm/dnvm.sh \
	&& dnvm upgrade -r coreclr "



COPY . /app
WORKDIR /app
RUN ["dnu", "restore"]

EXPOSE 5000
ENTRYPOINT ["dnx", "-p", "project.json", "web"]



