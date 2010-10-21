#!/bin/bash
# <troydwill@gmail.com> October 21, 2010

source ./rrp-lib.sh

for SCRIPT in 010_controller_welcome.sh \
    020_scaffold_user.sh \
    025_add_default_user.sh \
    030_identify_user.sh \
    040_login_form.sh \
    050_edit_login_out_welcome.sh \
    060_add_authenticate_method_to_user.sh \
    070_scaffold_ad.sh \
    080_scaffold_color.sh \
    090_scaffold_model.sh \
    100_scaffold_make.sh \
    110_scaffold_city.sh \
    120_scaffold_search.sh \
    130_scaffold_settings.sh \
    140_scaffold_links.sh \
    150_controller_ads_by_model; do
    ${EDITOR} ${SCRIPT}
    read -p "Run /bin/bash ${SCRIPT}?: <any key to continue> ";
    /bin/bash ${SCRIPT}
done
