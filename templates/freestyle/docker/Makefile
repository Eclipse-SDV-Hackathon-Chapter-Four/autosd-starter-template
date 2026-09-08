SHELL := /bin/bash
BUILD_DIR := _build
SRC_DIR := src
OCI_BIN := podman
OCI_IMAGE_NAME := localhost/autosd-qemu:dev

prepare:
	mkdir -p ${BUILD_DIR}

build: prepare
	gcc -o ${BUILD_DIR}/hello ${SRC_DIR}/hello.c


.PHONY: image
image:
	${OCI_BIN} build -t ${OCI_IMAGE_NAME} .

.PHONY: image/apply
image/apply:
	./scripts/bootc-apply-update ${OCI_IMAGE_NAME}
