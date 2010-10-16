source ./rrp-lib.sh

USER_MODEL="${TOP_DIR}/app/models/user.rb"

function add_authenticate_method () {

    cat >> ${USER_MODEL} <<EOF
# See page 163
def self.authenticate(username, password)
  user = self.find_by_username(username)
  if user
    if user.password != password
      user = nil
    end
  end
  user
end
EOF

    ${EDITOR} ${USER_MODEL}

}

add_authenticate_method
