FROM ubuntu:22.04

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
                openssh-server \
		inetutils-ping \
                ansible \
	; \
	rm -rf /var/lib/apt/lists/*

COPY test-remote-key /tmp
