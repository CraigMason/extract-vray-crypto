FROM rockylinux:9

RUN dnf install -y dnf-plugins-core \
    && dnf config-manager --set-enabled crb \
    && dnf install -y epel-release

RUN dnf install -y OpenImageIO OpenImageIO-utils python3-openimageio python3-numpy openexr

COPY extract-vray-crypto /usr/local/bin/extract-vray-crypto