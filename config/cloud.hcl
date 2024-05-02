bind_addr = "{{ GetPrivateIP }}"

client {
  enabled = true
  servers = ["54.227.11.127"]
  network_interface = "{{ GetDefaultInterfaces | attr \"name\" }}"
}