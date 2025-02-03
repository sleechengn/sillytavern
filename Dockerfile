from ubuntu:jammy
run apt update \
	&& apt install -y git \
	&& cd /opt \
	&& git clone https://github.com/SillyTavern/SillyTavern \
	&& cd SillyTavern

run apt install -y python3 python3-pip \
	&& pip install nodeenv

run echo '#!/usr/bin/bash' >> /docker-entrypoint.sh \
	&& echo 'source /opt/nodejs-23.7.0/bin/activate' >> /docker-entrypoint.sh \
	&& echo './start.sh' >> /docker-entrypoint.sh

run nodeenv --node=23.7.0 /opt/nodejs-23.7.0

run sed -i 's,^listen:.*,listen: true,g' /opt/SillyTavern/default/config.yaml
run sed -i "/whitelist:/a\  - 192.168.*.*" /opt/SillyTavern/default/config.yaml
workdir /opt/SillyTavern
run chmod +x /docker-entrypoint.sh
entrypoint [ "/docker-entrypoint.sh" ]
