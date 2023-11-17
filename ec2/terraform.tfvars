server_name    = "calabvm"
subnet_cidr    = "10.0.1.0/24"
az             = "us-west-2a"
os_type        = "linux"
ec2_monitoring = true
disk = {
  delete_on_termination = false
  encrypted             = true
  volume_size           = "20"
  volume_type           = "standard"
}
