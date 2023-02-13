FROM ubuntu:22.04

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
                openssh-server \
		inetutils-ping \
	; \
	rm -rf /var/lib/apt/lists/*

RUN mkdir ~/.ssh

COPY test-remote-key.pub /root/.ssh/authorized_keys
RUN chmod 600 ~/.ssh/authorized_keys

RUN service ssh start

CMD ["/usr/sbin/sshd","-D"]
