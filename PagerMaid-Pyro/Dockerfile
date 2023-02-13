FROM seedll/ubuntu_python

# runtime dependencies
COPY Enterpoint.sh /app/Enterpoint.sh

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime; \
    set -eux; \
    apt-get update; \
	apt-get install -y --no-install-recommends \
	git \
	neofetch \
	libzbar-dev ; \
	mkdir /conf ; \
	cd /app ; \
	git clone https://github.com/TeamPGM/PagerMaid-Pyro.git ; \
	cd PagerMaid-Pyro ; \
	pip install -r requirements.txt --target=. ; \
	rm -rf /var/lib/apt/lists/* ; \
	chmod +x /app/Enterpoint.sh

EXPOSE 3333

CMD ["/usr/bin/bash", "/app/Enterpoint.sh"]
