FROM ubuntu

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# set up root:root and me:me
RUN echo 'root:root' | chpasswd
RUN adduser me
RUN adduser me sudo
RUN echo 'me:me' | chpasswd

# run other commands as me
# install general system dependencies
RUN apt-get install -y git make unzip vim

# install ltiweb dependencies
RUN apt-get install -y apache2 libapache2-mod-fcgid

ADD ltiweb.conf /etc/apache2/sites-available/ltiweb

RUN a2ensite ltiweb
RUN service apache2 restart

EXPOSE 80
EXPOSE 22

CMD /usr/sbin/sshd -D
