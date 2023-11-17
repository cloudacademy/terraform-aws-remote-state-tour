variable "server_name" {
  description = "Name of the server"
  type        = string
}
variable "subnet_cidr" {
  description = "Subnet CIDR Block"
  type        = string
}
variable "az" {
  description = "Availability zone"
  type        = string
}
variable "ami_ids" {
  type        = map(any)
  description = "AMI ID's to deploy"
  default = {
    linux   = "ami-0d398eb3480cb04e7"
    windows = "ami-0afb7a78e89642197"
  }
}
variable "disk" {
  description = "OS image to deploy"
  type = object({
    delete_on_termination = bool
    encrypted             = bool
    volume_size           = string
    volume_type           = string
  })
}
variable "os_type" {
  description = "OS to deploy, Linux or Windows"
  type        = string
}
variable "instance_type" {
  description = "Size of the EC2 instance"
  type        = string
  default     = "t2.micro"
}
variable "ec2_monitoring" {
  description = "Configure monitoring on the EC2 instance"
  type        = bool
}

