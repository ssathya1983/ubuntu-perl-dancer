FROM        ubuntu:18.04
ENV LOGNAME root
RUN apt-get update
RUN apt-get install -y telnet build-essential curl cron
RUN apt-get install -y fence-agents ipmitool
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Dancer --force
RUN cpanm Carton Starman --force
RUN cpanm Carton Ubic --force
RUN cpanm Carton Ubic::Service::Plack --force
RUN ubic-admin setup --batch-mode
