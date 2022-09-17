# Environment
environment = ""
# VPC Variables
vpc_name = "Network-Prod-E1-VPC"
vpc_cidr_block = "10.0.0.0/16"
vpc_availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
network_prod_public_e1_sbnt = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
network_prod_private_e1_sbnt = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
network_prod_db_e1_sbnt= ["10.0.151.0/24", "10.0.152.0/24", "10.0.153.0/24"]
vpc_create_database_subnet_group = true 
vpc_create_database_subnet_route_table = true   
vpc_enable_nat_gateway = true  
vpc_single_nat_gateway = true
