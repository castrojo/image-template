FROM ghcr.io/ublue-os/bluefin:stable

# Modify build.sh with your customization
COPY build.sh /tmp/build.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit

RUN bootc container lint
