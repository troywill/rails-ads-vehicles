#!/bin/bash
for SCRIPT in 010_controller_welcome.sh \
    020_scaffold_post.sh \
    030_scaffold_make.sh \
    040_scaffold_model.sh \
    050_scaffold_city.sh; do
    echo "=> Running /bin/bash ${SCRIPT}"
    /bin/bash ${SCRIPT}
done
