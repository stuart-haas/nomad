bind_addr = "{{ GetInterfaceIP \"br-63d2c2609ebc\" }}"

client {
  enabled = true
  servers = ["54.227.11.127"]
  network_interface = "{{ GetDefaultInterfaces | attr \"name\" }}"
}