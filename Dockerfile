#         __          .__
# _______/  |_ ___.__.|  |_______
# \____ \   __<   |  ||  |\_  __ \
# |  |_> >  |  \___  ||  |_|  | \/
# |   __/|__|  / ____||____/__|
# |__|         \/
#
# https://ptylr.com
# https://www.linkedin.com/in/ptylr/
#
##########################################################################
# Image: ptylr/docker-core-php
##########################################################################
FROM ptylr/docker-core-nginx
MAINTAINER Paul Taylor <me@ptylr.com>

ENV REFRESHED_AT 2024-07-11
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -yqq update
RUN apt-get -yqq install software-properties-common
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get -yqq update
RUN apt-get -yqq install -y php8.3\
    php8.3-cli\
    php8.3-common\
    php8.3-fpm\
    php8.3-mysql\
    php8.3-zip\
    php8.3-gd\
    php8.3-mbstring\
    php8.3-curl\
    php8.3-xml\
    php8.3-bcmath\
    php8.3-pdo
RUN apt-get install -yqq php8.3-fpm php8.3-cli

ADD startcontainer.sh /opt/container/
RUN chmod u+x /opt/container/startcontainer.sh

# Launch service
ENTRYPOINT [ "/bin/bash", "/opt/container/startcontainer.sh" ]
