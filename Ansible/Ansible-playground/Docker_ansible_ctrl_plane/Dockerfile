# syntax=docker/dockerfile:1.4
FROM ubuntu:22.04

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
                openssh-server \
		inetutils-ping \
                ansible \
	; \
	rm -rf /var/lib/apt/lists/*

COPY --link test-remote-key /tmp/
