FROM        ubuntu:18.04
ENV LOGNAME root
RUN apt-get update
RUN apt-get install -y libssl-dev libpq-dev libxml2-dev telnet build-essential curl cron
RUN apt-get install -y fence-agents ipmitool
RUN curl -L http://cpanmin.us | perl - App::cpanminus
RUN cpanm Carton Dancer --force
RUN cpanm Carton Starman --force
RUN cpanm Carton Ubic --force
RUN cpanm Carton Ubic::Service::Plack --force
RUN cpanm Carton YAML JSON DBI --force
RUN cpanm Carton Net::SNMP --force
RUN cpanm Carton IO::Pty --force
RUN cpanm Carton REST::Client IPC::ShareLite --force
RUN cpanm Carton Proc::Simple --force
RUN cpanm Carton Data::Serializer Time::Zone --force
RUN ubic-admin setup --batch-mode
