ARG IMAGE=tekki/mojolicious
ARG TAG=9.38-pg
FROM ${IMAGE}:${TAG}

RUN set -ex \
  && apt-get update && apt-get install -y --no-install-recommends \
  libauthen-sasl-perl \
  libnet-ssh2-perl \
  libgd-dev \
  libgd-perl \
  libio-socket-ssl-perl \
  libemail-valid-perl \
  libexcel-writer-xlsx-perl \
  libemail-address-list-perl \
  libemail-mime-perl \
  libemail-valid-perl \
  libemail-sender-perl \
  libmail-imapclient-perl \
  libencode-hanextra-perl \
  libgeo-ip-perl \
  libdomain-publicsuffix-perl \
  libauthen-sasl-perl \
  libhtml-scrubber-perl \
  libdatetime-perl \
  libdatetime-format-pg-perl \
  libmojolicious-plugin-assetpack-perl \
  libmojolicious-plugin-authentication-perl  \
  libhttp-browserdetect-perl \
  libuniversal-require-perl \
  libnet-scp-expect-perl  \
  libcss-minifier-perl \
  libjavascript-minifier-perl \
  libgd-securityimage-perl   \
  libemail-address-list-perl \
  libcss-minifier-xs-perl \
  libmime-tools-perl \
  libclone-perl \
  graphicsmagick \
  graphicsmagick-imagemagick-compat \
  libgraphics-magick-perl \
  libcrypt-openssl-rsa-perl \
  && rm -r /var/lib/apt/lists/* 
 # libmodule-pluggable-perl
RUN cpanm   \
  Mojolicious::Plugin::RemoteAddr \
  Module::Pluggable@5.2 \
  Email::Sender::Simple \
  Encode::Detect::Detector \
  Mojolicious::Plugin::Minion \
  WWW::Crawler::Mojo \
  Mojolicious::Plugin::Captcha  \
  Mojolicious::Plugin::Restify \
  Mojolicious::Plugin::Cron \
  Crypt::Mode::CBC \
  Algorithm::HowSimilar \
  CSS::Sass \
  Mojo::JWT::Google  \
  Authen::SASL  \
  && rm -r /root/.cpanm

ARG NOW=not-set
CMD ["/bin/bash", "-c"]
