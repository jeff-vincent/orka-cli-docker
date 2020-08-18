# Dockerfile

FROM ubuntu:18.04

ENV OPENCONNECT_USER <your_vpn_username>
ENV OPENCONNECT_URI <your_vpn_uri>

ADD https://cli-builds-public.s3-eu-west-1.amazonaws.com/official/1.4.0/d621805/linux/orka.zip /tmp
RUN apt-get update && apt-get install openconnect -y && apt install unzip && apt install curl -y
RUN unzip /tmp/orka.zip && rm -rf orka.zip
RUN mv orka /usr/local/bin/orka && rm -rf tmp
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
CMD ["sh","-c","openconnect -u ${OPENCONNECT_USER} ${OPENCONNECT_URI}"]
