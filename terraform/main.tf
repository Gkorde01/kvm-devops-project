terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.9.7"
    }
  }
}

provider "libvirt" {
  uri = "qemu:///system"
}

resource "libvirt_domain" "vm1" {
  name   = "vm1"
  memory = 1024
  vcpu   = 1
  type   = "kvm"

  network_interface {
    network_name = "default"
  }

  console {
    type        = "pty"
    target_port = "0"
  }
}
