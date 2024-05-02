bind_addr = "0.0.0.0"

client {
  enabled = true
  network_interface = "{{ GetDefaultInterfaces | attr \"name\" }}"
}