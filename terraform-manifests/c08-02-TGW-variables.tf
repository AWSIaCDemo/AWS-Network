variable "environment" {
  description = "Deployment environment passed as argument or environment variable"
  type        = string
  default     = null
}

variable "org_arn" {
  description = "The ARN of the AWS Organization this account belongs to"
  type        = string
  default     = ""
}

variable "az_names" {
  description = "A list of the Availability Zone names available to the account"
  type        = list(string)
  default     = []
}

variable "cidr" {
  description = "Corporate CIDR range for use with blackholing traffic between production and development environments"
  type        = string
  default     = []
}

variable "inspection_attachment" {
  description = "Inspection VPC attachment for default route"
  type        = string
  default     = {}
}

variable "tgw_route_tables" {
  description = "List of route tables to create for the transit gateway"
  type        = list(string)
  default     = {}
}
