FROM alpine:latest

MAINTAINER MeidoDev <MeidoDev@users.noreply.github.com>

ADD nginx.conf /nginx.conf
ADD init.sh /init.sh

RUN apk update \
	&& apk add --no-cache --update aria2 nginx \
	&& mkdir -p /downloads /aria-ng /aria-run \
	&& wget https://github.com/mayswind/AriaNg/releases/download/1.3.7/AriaNg-1.3.7.zip \
	&& unzip AriaNg-1.3.7.zip -d aria-ng \
	&& rm AriaNg-1.3.7.zip \
	&& chmod +x init.sh

ENV UPLOAD_LIMIT="1M"
ENV DOWNLOAD_LIMIT="10M"
ENV SEED_RATIO="1.25"

WORKDIR /
VOLUME ["/downloads", "/aria-run"]
EXPOSE 80/tcp 6868/tcp 6868/udp

CMD ["/init.sh"]
