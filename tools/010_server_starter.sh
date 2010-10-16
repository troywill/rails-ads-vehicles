source ./rrp-lib.sh
START_SCRIPT='rails-server.sh'

cp -v ${START_SCRIPT} ${TOP_DIR}
cd ${TOP_DIR} && chmod +x ${START_SCRIPT} && ./${START_SCRIPT} ${PORT}
