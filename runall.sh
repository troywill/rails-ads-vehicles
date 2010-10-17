#!/bin/bash
# <troydwill@gmail.com> October 2010

source ./rrp-lib.sh

for SCRIPT in 010_controller_welcome.sh \
    020_scaffold_ad.sh \
    030_scaffold_model.sh \
    040_scaffold_make.sh \
    050_scaffold_city.sh \
    060_scaffold_search.sh \
    070_scaffold_settings.sh; do
    ${EDITOR} ${SCRIPT}
    echo "=> Run /bin/bash ${SCRIPT}?: <any key to continue>";
    read $answer
    /bin/bash ${SCRIPT}
done
