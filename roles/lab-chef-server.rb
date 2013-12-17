name "lab-chef-server"
description "Default run_list for the Chef Server node"
run_list(
  "role[lab-admin]",
  "recipe[chef-server::default]"
  )
