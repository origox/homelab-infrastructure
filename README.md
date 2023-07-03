# homelab-infrastructure

# cluster nodes
Cluster infrastructure automation by Terraform

## Node configuration:
- 3 Proxmox VMs as Master Nodes
- 3 Proxmox VMs as Agent Nodes
- 3 Proxmox VMs with SSD as Storage Nodes

## VM base image
VM's will be based on an Ubuntu cloud-init image, see [Create Proxmox Template](https://gist.github.com/origox/a90a8c8124166883e30f9a40b787086f)

## Terraform script pre-requisite
Create proxmox api token

Create a credentials.auto.tfvars file and define secrets:
- proxmox_api_url
- proxmox_api_token_id
- proxmox_api_token_secret

## Terraform execution
```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## Post config
size disk to "suitable value" for each longhorn vm 