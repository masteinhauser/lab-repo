name "lab-pxe-server"
description "Default run_list for the PXE server node"
run_list(
  "role[lab-admin]",
  "recipe[pxe_dust::server]"
  )
