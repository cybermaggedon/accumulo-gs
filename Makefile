
REPOSITORY=cybermaggedon/accumulo-gs
VERSION=$(shell git describe | sed 's/^v//')

SUDO=
BUILD_ARGS=

all: gcs-connector-latest-hadoop2.jar
	${SUDO} docker build ${BUILD_ARGS} -t ${REPOSITORY}:${VERSION} .

push:
	${SUDO} docker push ${REPOSITORY}:${VERSION}

gcs-connector-latest-hadoop2.jar:
	wget https://storage.googleapis.com/hadoop-lib/gcs/gcs-connector-latest-hadoop2.jar

