FROM alpine AS docker
ENV DOCKER_VERSION=20.10.8
WORKDIR /output
RUN apk add curl
RUN curl https://download.docker.com/linux/static/stable/$(uname -m)/docker-${DOCKER_VERSION}.tgz | tar zx docker/docker

FROM alpine AS kubectl
ENV KUBECTL_VERSION=1.22.0
ARG TARGETPLATFORM
WORKDIR /output
RUN apk add curl
RUN curl -LO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/${TARGETPLATFORM}/kubectl
RUN chmod +x kubectl

FROM alpine AS terraform
ENV TERRAFORM_VERSION=1.0.4
ARG TARGETPLATFORM
WORKDIR /output
RUN apk add curl
RUN curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${TARGETPLATFORM/\//_}.zip
RUN unzip terraform_${TERRAFORM_VERSION}_${TARGETPLATFORM/\//_}

FROM alpine
COPY --from=docker /output/docker/docker /usr/local/bin/
COPY --from=kubectl /output/kubectl /usr/local/bin/
COPY --from=terraform /output/terraform /usr/local/bin/

CMD \
	docker version ; \
	kubectl version ; \
	terraform version ; \
        uname -a

