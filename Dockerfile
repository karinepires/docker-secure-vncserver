FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:gnome3-team/gnome3-staging -y
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install gnome-core -y
RUN apt-get install xfce4 -y
RUN apt-get install firefox -y
RUN apt-get install wget -y
RUN wget http://sourceforge.net/projects/turbovnc/files/2.0/turbovnc_2.0_amd64.deb
RUN dpkg -i turbovnc_2.0_amd64.deb
RUN apt-get install -y git make gcc
RUN git clone https://github.com/kanaka/websockify
RUN cd websockify && make
ADD self.pem /

ENV DISPLAY :1

EXPOSE 5900

ENTRYPOINT ./websockify/run 5900 --wrap-mode=ignore -- /opt/TurboVNC/bin/vncserver -nohttpd -novncauth -nopam -rfbport 5900