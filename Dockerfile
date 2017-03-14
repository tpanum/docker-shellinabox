FROM fedora:latest

ENV SIAB_VERSION=2.19 \
  SIAB_USERCSS="Normal:+/usr/share/shellinabox/white-on-black.css,Monochrome:-/usr/share/shellinabox/monochrome.css,Colors:-/usr/share/shellinabox/color.css" \
  SIAB_PORT=4200 \
  SIAB_ADDUSER=true \
  SIAB_USER=guest \
  SIAB_USERID=1000 \
  SIAB_GROUP=guest \
  SIAB_GROUPID=1000 \
  SIAB_PASSWORD=putsafepasswordhere \
  SIAB_SHELL=/bin/bash \
  SIAB_HOME=/home/guest \
  SIAB_SUDO=false \
  SIAB_SSL=true \
  SIAB_SERVICE=/:LOGIN \
  SIAB_PKGS=none \
  SIAB_SCRIPT=none

RUN dnf install -y openssh-clients procps-ng sudo shellinabox && \
    dnf clean all

EXPOSE 4200

ADD assets/entrypoint.sh /usr/local/sbin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["shellinabox"]
