variable "internship_vpc" {
  type        = string
  default     = "vpc-04e2e4df2deec96f6"
  description = "internship_vpc"
}

variable "subnet_internshi_private1_id" {
  type        = string
  default     = "subnet-09d9888e0daab307d"
  description = "ECSのtask定義用のsubnet_id"
}


variable "security_group_http" {
  type        = string
  default     = "sg-05a017e25d88e1fd9"
  description = "internship-between-subnet"
}

variable "security_group_nfs" {
  type        = string
  default     = "sg-0f7db0b70c96537f1"
  description = "internship-efs-sq"
}


variable "private_route_table_id" {
  type        = string
  default     = "rtb-024eee6fb5e3ba5da"
  description = "プライベートサブネットがネットに接続するためのルートテーブル"
}
