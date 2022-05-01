variable "instance_type" {
  description = "type of the instance type"
  default     = "t2.micros"
}

variable "instance_type_splunk"{
  description = "type of the instance type splunk"
  default     = "t3.small"
}

variable "project_name" {
  description = "Name of the project"
}

variable "public_key_labs" {
  description = "Content of the public key lab to add to the keypair"
}

variable "public_key_bastion"{
  description = "Content of the public key bastion to add to the keypair"
}

variable "region" {
  description = "region"
}

variable "zone_id" {
  description = "Hosted zone id in route53"
}

variable "azs" {
  type        = list(string)
  description = "A list of availability zones names or ids in the region"
}

variable "private_subnets" {
  type        = list(string)
  description = "A list of intra subnets"
}

variable "public_subnets" {
  type        = list(string)
  description = "A list of public subnets inside the VPC"
}

variable "create_lb"{
  type        = bool
  description = "If set to true, create a lb"
}

variable "create_proxy"{
  type        = bool
  description = "If set to true, create an instance proxy"
}

variable "create_db"{
  type        = bool
  description = "If set to true, create a database"
}

variable "create_bastion"{
  type        = bool
  description = "If set to true, create a bastion"
}

variable "create_splunk"{
  type = bool
  description = "If set to true, create a splunk"
}

variable "target_group_splunk_sticky" {
  type    = bool
  default = true
}

variable "target_group_db_sticky" {
  type    = bool
  default = true
}

variable "target_group_web_sticky" {
  type    = bool
  default = true
}

variable "target_group_splunk_path" {
  type = string
}

variable "target_group_splunk_port" {
  type = number
}

variable "target_group_splunk_matcher"{
  type = string
}

variable "target_group_web_path" {
  type = string
}

variable "target_group_web_port" {
  type = number
}

variable "target_group_web_matcher" {
  type = string
}

variable "target_group_db_path" {
  type = string
}

variable "target_group_db_port" {
  type = number
}

variable "target_group_db_matcher" {
  type = string
}

variable "s3_bucket_alb" {
  type = string
}

variable "lb_name" {
  type = string
}

variable "number_of_instances_bastion" {
  type = number
}

variable "number_of_instances_proxy" {
  type = number
}

variable "number_of_instances_db" {
  type = number
}

variable "number_of_instances_web" {
  type = number
}

variable "number_of_instances_splunk" {
  type = number
}

variable "token_github_config_momg-labs"{
  type = string
  description = "Token github"
}

variable "EC2_SPLUNK_VOLUME_SIZE" {
  type        = string
  default     = "5000"
  description = "The volume size for the root volume in GiB"
}
variable "EC2_SPLUNK_VOLUME_TYPE" {
  type        = string
  default     = "gp2"
  description = "The type of data storage: standard, gp2, io1"
}
variable "EC2_SPLUNK_VOLUME_DELETE_ON_TERMINATION" {
  default     = true
  description = "Delete the root volume on instance termination."
}

variable "host_name_db"{
  type = list(string)
  default = ["db.momg-labs.ca"]
}

variable "repository_config_momg-labs"{
  type = string
  description = "Repository of config_momg-labs"
}

variable "domain_lab"{
  type = string
  description = "Domain lab"
}
