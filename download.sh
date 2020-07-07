#!/bin/bash
IMAGE_SITE="https://shoggoth-images.labs.cromulence.com/"
IMAGES=("debian9.qcow2" \
       	"pwnme_little.blocks" "pwnme_little.rsave" "pwnme_little.vmstate" \
       	"pwnme_lots.blocks" "pwnme_lots.rsave" "pwnme_lots.vmstate" \
       	"exec_me.blocks" "exec_me.rsave" "exec_me.vmstate" \
	)
for i in "${IMAGES[@]}"
do
	wget -O $i $IMAGE_SITE$i
done

