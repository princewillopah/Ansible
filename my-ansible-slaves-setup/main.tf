module "vpc-module" {
  source = "./modules/VPC"
  vpc_env_prefix = var.env_prefix
  VPC_avail_zone = var.avail_zone

}


module "EC2-module" {
  source = "./modules/EC2"
  EC2_env_prefix = var.env_prefix
  EC2_avail_zone = var.avail_zone
  subnet-1-id-for-EC2 = module.vpc-module.subnet-output-1.id  #taking the value from the module above
  subnet-2-id-for-EC2 = module.vpc-module.subnet-output-2.id  #taking the value from the module above
  vpc_id-for-EC2 = module.vpc-module.my-main-vpc-output.id  # taken  the value from the module above #so the servers in the vpc can be associated weith the secuerity group
  # vpc_id-for-EC2-2 = module.vpc-module.my-main-vpc-output-2.id 
}






