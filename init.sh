#!/bin/sh

nginx -c /nginx.conf &

aria2c --dir=/downloads \
    --bt-detach-seed-only=true \
    --bt-force-encryption=true \
    --bt-remove-unselected-file=true \
    --dht-file-path=/aria-run/dht.dat \
    --dht-listen-port=6868 \
    --listen-port=6868 \
    --max-overall-upload-limit=$UPLOAD_LIMIT \
    --seed-ratio=$SEED_RATIO \
    --enable-rpc=true \
    --rpc-listen-port=6800 \
    --rpc-save-upload-metadata=false \
    --console-log-level=error \
    --disable-ipv6=true \
    --enable-color=false \
    --file-allocation=none \
    --max-overall-download-limit=$DOWNLOAD_LIMIT \
    --no-conf=true \
    --save-session=/aria-run/session \
    --save-session-interval=60
