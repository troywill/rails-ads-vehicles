#!/bin/bash
# <troydwill@gmail.com> October 21, 2010

source ./rrp-lib.sh

for SCRIPT in 010_controller_welcome.sh \
    020_scaffold_user.sh \
    030_add_default_user.sh \
    040_identify_user.sh \
    050_login_form.sh \
    060_edit_login_out_welcome.sh \
    070_add_authenticate_method_to_user.sh \
    080_scaffold_ad.sh \
    090_scaffold_color.sh \
    100_scaffold_model.sh \
    110_scaffold_make.sh \
    120_scaffold_city.sh \
    130_scaffold_search.sh \
    140_scaffold_settings.sh \
    150_scaffold_links.sh \
    160_controller_frame.sh \
    170_controller_FrameSearch.sh; do
    ${EDITOR} ${SCRIPT}
    read -p "Run /bin/bash ${SCRIPT}?: <any key to continue> ";
    /bin/bash ${SCRIPT}
    rake test
done
