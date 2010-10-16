source ./rrp-lib.sh

function check_admin_user () {
    # Not a big deal, but should create initial user before adding
    # the indentification system
    echo "Set up first user? (Any key to continue)..."
    read -e DUMMY
}


function add_before_filter_to_application_controller () {
    APPLICATION_CONTROLLER="${TOP_DIR}/app/controllers/application_controller.rb"

    cat >> ${APPLICATION_CONTROLLER} <<EOF
# See page 178
# place after the class line
before_filter :identify_user, :except => :login
EOF

    ${EDITOR} ${APPLICATION_CONTROLLER}

    cat >> ${APPLICATION_CONTROLLER} <<EOF
# See page 178
def identify_user
  if User.find_by_id(session[:user_id])
    @user = User.find_by_id(session[:user_id])
  else
    flash[:notice] = "Please log in"
    redirect_to :controller => :welcome, :action => :login
  end
end
EOF

${EDITOR} ${APPLICATION_CONTROLLER}

}

check_admin_user
add_before_filter_to_application_controller
restart_server
