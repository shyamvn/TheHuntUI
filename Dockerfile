FROM ubuntu:latest


RUN apt-get --yes --force-yes  install unzip curl
RUN ["/bin/bash", "-c", "curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh"]
RUN ["/bin/bash", "-c", "source ~/.dnx/dnvm/dnvm.sh"]


RUN  echo "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty-3.6 main" | sudo tee /etc/apt/sources.list.d/llvm.list
RUN  wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key --yes --force-yes add -
RUN  sudo apt-get --yes --force-yes update

RUN apt-get --yes --force-yes install cmake llvm-3.5 clang-3.5 lldb-3.6 lldb-3.6-dev libunwind8 libunwind8-dev gettext libicu-dev liblttng-ust-dev libcurl4-openssl-dev libssl-dev uuid-dev
RUN dnvm upgrade -r coreclr



COPY . /app
WORKDIR /app
RUN ["dnu", "restore"]

EXPOSE 5000
ENTRYPOINT ["dnx", "-p", "project.json", "web"]



