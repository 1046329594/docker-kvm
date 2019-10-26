FROM ubuntu:16.04
MAINTAINER Emre <e@emre.pm>

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && \
  apt-get install -y qemu-kvm qemu-utils bridge-utils dnsmasq uml-utilities iptables wget net-tools && \
  apt-get autoclean && \
  apt-get autoremove && \
  rm -rf /var/lib/apt/lists/*

ADD startup.sh /

ENV RAM 3072
ENV SMP 2
ENV CPU qemu64
ENV DISK_DEVICE scsi
ENV IMAGE /data/disk-image
ENV IMAGE_FORMAT qcow2
ENV IMAGE_SIZE 40G
ENV IMAGE_CACHE none
ENV IMAGE_DISCARD unmap
ENV IMAGE_CREATE 1
ENV ISO https://software-download.microsoft.com/sg/Windows10_InsiderPreview_Client_x64_zh-cn_18990.iso?t=7554f58a-1ea7-496b-832d-b9786c23a165&e=1572190356&h=17f3ffe0d050d3fc0491fe622354c0f3
ENV ISO2 https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/stable-virtio/virtio-win.iso
ENV ISO_DOWNLOAD 1
ENV NETWORK tap
ENV VNC tcp
ENV VNC_IP ""
ENV VNC_ID 0
ENV VNC_PORT 5500
ENV VNC_SOCK /data/vnc.sock
ENV TCP_PORTS ""
ENV UDP_PORTS ""

VOLUME /data

ENTRYPOINT ["/startup.sh"]
