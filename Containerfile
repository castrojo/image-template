FROM ghcr.io/ublue-os/bluefin:stable

# Modify build.sh with your customization
COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit

RUN ln -sf /run /var/run && \
    mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    dnf clean all && \
    ostree container commit 

RUN bootc container lint
