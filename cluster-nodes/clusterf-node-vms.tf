locals {
  virtual_machines = {
    "k3s-prod-server-1" = {
      target_node = "pve1"
    }
    "k3s-prod-server-2" = {
      target_node = "pve2"
    }
    "k3s-prod-server-3" = {
      target_node = "pve1"
    }
    "k3s-prod-agent-1" = {
      target_node = "pve1"
    }
    "k3s-prod-agent-2" = {
      target_node = "pve2"
    }
    "k3s-prod-agent-3" = {
      target_node = "pve1"
    }
    "k3s-prod-longhorn-1" = {
      target_node = "pve1"
    }
    "k3s-prod-longhorn-2" = {
      target_node = "pve2"
    }
    "k3s-prod-longhorn-3" = {
      target_node = "pve1"
    }
  }
}


resource "proxmox_vm_qemu" "vm" {
    
    for_each = local.virtual_machines
    
    name = each.key
    target_node = each.value.target_node

    clone = "ubuntu-cloud-jammy"
    full_clone = true

    onboot = true

    memory = 4096
    cores = 2
    sockets = 1
    cpu = "kvm64"
    scsihw = "virtio-scsi-pci"
}