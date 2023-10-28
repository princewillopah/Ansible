resource "aws_key_pair" "myapp-key-pair" {
  key_name   = "myapp-key-pair"
  public_key = file(var.public_key_location)
  
  tags = {
    Name = "${var.EC2_env_prefix}-key_pair"
  }
}


resource "aws_instance" "EC2-instance1" {
  ami           = "ami-0989fb15ce71ba39e" # for eu-north-1
  instance_type = "t3.micro"

  # if we do not specify the vpc subnets info here, the ec2 instance will be situated in the default VPC that came with the account 
  subnet_id     =  var.subnet-1-id-for-EC2
  vpc_security_group_ids    = [aws_default_security_group.myapp-default-security-group.id] #this remain untouched because we have it here as a resource
  availability_zone    = var.EC2_avail_zone[0]

  associate_public_ip_address    = true # to make sure public ip is display
  key_name     = aws_key_pair.myapp-key-pair.key_name #stating that we are using an a keypair generated above


  user_data = file("docker-container.sh") #handles instalation of docker on ec2 instance and running nginx on it


 tags = {
    Name = "${var.EC2_env_prefix}-EC2-instance1"
  }
}


resource "aws_instance" "EC2-instance2" {
  ami           = "ami-0989fb15ce71ba39e" # for eu-north-1
  instance_type = "t3.micro"

  # if we do not specify the vpc subnets info here, the ec2 instance will be situated in the default VPC that came with the account 
  subnet_id     =  var.subnet-2-id-for-EC2
  vpc_security_group_ids    = [aws_default_security_group.myapp-default-security-group.id] #this remain untouched because we have it here as a resource
  availability_zone    = var.EC2_avail_zone[1]

  associate_public_ip_address    = true # to make sure public ip is display
  key_name     = aws_key_pair.myapp-key-pair.key_name #stating that we are using an a keypair generated above


  user_data = file("docker-container.sh") #handles instalation of docker on ec2 instance and running nginx on it


 tags = {
    Name = "${var.EC2_env_prefix}-EC2-instance2"
  }
}

# resource "aws_instance" "EC2-instance" {
#   count = length(var.subnet_cidr_block)

#   ami           = "ami-0989fb15ce71ba39e" # for eu-north-1
#   instance_type = "t3.micro"

#   subnet_id     = var.subnet-id-for-EC2[count.index] # Assuming you have a list of subnet IDs

#   vpc_security_group_ids = [aws_default_security_group.myapp-default-security-group.id]
#   availability_zone      = element(var.availability_zones, count.index)

#   associate_public_ip_address = true
#   key_name                   = aws_key_pair.myapp-key-pair.key_name

#   user_data = file("docker-container.sh")

#   tags = {
#     Name = "${var.EC2_env_prefix}-myapp-EC2-instance-${count.index}"
#   }
# }