FROM quay.io/centos/centos:stream10 AS builder

# add your build tools here
RUN dnf install -y gcc make

COPY . /opt/workspace

RUN (cd /opt/workspace; make build)

FROM ghcr.io/eclipse-autosd/eclipse-autosd-bootc-qemu:latest

COPY --from=builder /opt/workspace/_build/hello /usr/bin/hello
