FROM amazon/aws-cli:2.9.16

LABEL description="This image provides commonly used tools"

ARG TERRAFORM_VERSION=1.4.2
ARG TERRAFORM_DOCS_VERSION=v0.16.0
ARG HELM_VERSION=v3.12.0
ARG HELMFILE_VERSION=0.154.0
ARG KUBECTL_VERSION=v1.16.1
ARG GCP_CLI_VERSION=417.0.1
ARG ANSIBLE_VERSION=4.10.0
ARG YQ_VERSION=v4.34.1

RUN yum install -y jq gzip nano tar git unzip wget curl zsh python3 && yum -y clean all && rm -rf /var/cache

#get terraform & terraform docs
RUN set -eux \
    && curl -o /tmp/terraform.zip -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip /tmp/terraform.zip \
    && chmod +x terraform && mv terraform /usr/local/bin/ \
    && terraform -version \
    && curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/${TERRAFORM_DOCS_VERSION}/terraform-docs-${TERRAFORM_DOCS_VERSION}-$(uname)-amd64.tar.gz \
    && tar -xzf terraform-docs.tar.gz \
    && mv terraform-docs /usr/local/bin \
    && terraform-docs --version

#get helm
RUN curl -o /tmp/helm.tar.gz -LO https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && mkdir /tmp/Helm && tar -zxf /tmp/helm.tar.gz -C /tmp/Helm --strip-components 1 \
    && mv /tmp/Helm/helm /usr/local/bin/ \
    && helm version

#get helmfile & helm diff plugin
RUN set -eux \
    && curl -o /tmp/helmfile.tar.gz -L https://github.com/helmfile/helmfile/releases/download/v${HELMFILE_VERSION}/helmfile_${HELMFILE_VERSION}_linux_amd64.tar.gz \
    && tar -zxf /tmp/helmfile.tar.gz -C /tmp \
    && chmod +x /tmp/helmfile \
    && mv /tmp/helmfile /usr/local/bin \
    && helmfile --version \
    && helm plugin install https://github.com/databus23/helm-diff

#get kubectl
RUN curl -o /tmp/kubectl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && chmod +x /tmp/kubectl \
    && mv /tmp/kubectl /usr/local/bin/kubectl \
    && kubectl

#get gcp_sdk
RUN curl -o /tmp/google.tar.gz -LO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-${GCP_CLI_VERSION}-linux-x86_64.tar.gz \
    && mkdir -p /usr/local/gcloud \
    && tar -C /usr/local/gcloud -xvf /tmp/google.tar.gz \
    && /usr/local/gcloud/google-cloud-sdk/install.sh
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

#get ansible
RUN python3 -m pip install ansible==${ANSIBLE_VERSION}

#get kubectx & kubens
RUN git clone https://github.com/ahmetb/kubectx /tmp/kubectx \
    && chmod +x /tmp/kubectx/kube* \
    && mv /tmp/kubectx/kube* /usr/local/bin

#get yq yaml processor
RUN wget https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -O /usr/bin/yq \
    && chmod +x /usr/bin/yq

#clear temp files
RUN rm -rf /tmp/* 

#config non-root user
RUN useradd -m 1000

#some aliases (without command -v {HOME}:/home/1000)
RUN echo 'alias k="kubectl"' >> /home/1000/.zshrc \
    && echo 'alias t="terraform"' >> /home/1000/.zshrc \
    && echo 'alias kctx="kubectx"' >> /home/1000/.zshrc \
    && echo 'alias kns="kubens"' >> /home/1000/.zshrc

USER 1000
