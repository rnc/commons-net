FROM quay.io/ncross/hacbs-jvm-build-request-processor:dev AS build-request-processor
FROM quay.io/redhat-user-workloads/rhtap-build-tenant/jvm-build-service-builder-images/ubi8:d6c417eae5fe32f3207918c6395881843e534a5d
USER 0
WORKDIR /root
RUN mkdir -p /root/project /root/software/settings /original-content/marker && microdnf install vim curl procps-ng
#RUN rpm -ivh https://rpmfind.net/linux/centos/8-stream/BaseOS/x86_64/os/Packages/tree-1.7.0-15.el8.x86_64.rpm

COPY --from=build-request-processor /deployments/ /root/software/build-request-processor
COPY --from=build-request-processor /lib/jvm/jre-17 /root/software/system-java
COPY --from=build-request-processor /etc/java/java-17-openjdk /etc/java/java-17-openjdk

ENV JBS_DISABLE_CACHE=true

# Requires to be run as 'podman|docker build -f .jbs/Dockerfile .' to set the correct context.
COPY .jbs/*.sh /root
COPY . /root/project/workspace/

RUN /root/run-full-build.sh
FROM scratch
COPY --from=1 /root/project/artifacts /root/artifacts
