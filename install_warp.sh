#!/bin/bash

docker rm -f warp && \
docker run --privileged -d \
  --name warp \
  --restart always \
  -p 40000:1080 \
  -e WARP_SLEEP=10 \
  -e BETA_FIX_HOST_CONNECTIVITY=1 \
  --cap-add MKNOD \
  --cap-add AUDIT_WRITE \
  --cap-add NET_ADMIN \
  --sysctl net.ipv6.conf.all.disable_ipv6=0 \
  --sysctl net.ipv4.conf.all.src_valid_mark=1 \
  --restart unless-stopped \
  -v /data:/var/lib/cloudflare-warp \
  caomingjun/warp
