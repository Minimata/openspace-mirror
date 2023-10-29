FROM ubuntu:focal

# Install common packages
RUN apt-get update \
	&& apt-get install -y \
	curl \
	git \
	sudo \
	wget \
	python3 \
	gnupg  \
	&& rm -rf /var/lib/apt/lists/*

# Install Terraform
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata
RUN apt-get install -y software-properties-common 
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
	gpg --dearmor | \
	tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN gpg --no-default-keyring \
	--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
	--fingerprint
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
	https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
	tee /etc/apt/sources.list.d/hashicorp.list
RUN apt update && apt-get install terraform

# # Install Openstack

RUN add-apt-repository -y cloud-archive:victoria && apt update

RUN apt-get install -y \
	python3-aodhclient \
	python3-barbicanclient \
	python3-cinderclient \
	python3-cloudkittyclient \
	python3-glanceclient \
	python3-gnocchiclient \
	python3-heatclient \
	python3-keystoneclient \
	python3-magnumclient \
	python3-neutronclient \
	python3-novaclient \
	python3-octaviaclient \
	python3-openstackclient \
	python3-osc-placement \
	python3-swiftclient

ARG USER=coder
RUN useradd --groups sudo --no-create-home --shell /bin/bash ${USER} \
	&& echo "${USER} ALL=(ALL) NOPASSWD:ALL" >/etc/sudoers.d/${USER} \
	&& chmod 0440 /etc/sudoers.d/${USER}
USER ${USER}
WORKDIR /home/${USER}
