# syntax=docker/dockerfile:1.4
FROM ubuntu:22.04

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
                openssh-server \
		inetutils-ping \
                dumb-init \
                python-is-python3 \
	; \
	rm -rf /var/lib/apt/lists/*

RUN mkdir ~/.ssh

COPY --link test-remote-key.pub /root/.ssh/authorized_keys
RUN chmod 600 ~/.ssh/authorized_keys

RUN service ssh start

CMD ["dumb-init", "/usr/sbin/sshd", "-D"]
