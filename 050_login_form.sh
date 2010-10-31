#!/bin/bash

source ./rrp-lib.sh
LOGIN_PAGE="${TOP_DIR}/app/views/welcome/login.html.erb"

function append_login_form () {

    cat >> ${LOGIN_PAGE} <<EOF
<fieldset>
  <legend>Please Log In</legend>
  <% form_tag do %>
    <p>
      <label for="name">Username:</label>
      <%= text_field_tag :username, params[:username] %>
    </p>
    <p>
      <label for="password">Password:</label>
      <%= password_field_tag :password, params[:password] %>
    </p>
    <p>
      <%= submit_tag "Login" %>
    </p>
  <% end %>
</fieldset>
EOF
}

####### Main program #######
    
append_login_form
${EDITOR} ${LOGIN_PAGE}
