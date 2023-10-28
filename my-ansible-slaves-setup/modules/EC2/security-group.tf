# resource "aws_security_group" "myapp-security-group" {
#   name        = "myapp-security-group"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.myapp-vpc.id    #so the servers in the vpc can be associated weith the secuerity group

# 		 #so ingress block handles the incoming requests/traffics to access the resources in the VPC such as accessing the ec2 instance from your CLI 0r accessing the nginx on port 8080 on port 22. in these cases we are sending traffic/requests to the VPC to access the EC2 instance or the nginx in it
#   #rules to expose port 22 for aceessing ec2 instance ourside
#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 22
#     to_port          = 22
#     protocol         = "tcp"
#     cidr_blocks      = [var.my-ip]
#   }
# #rules to expose port 22 for aceessing ec2 instance ourside
#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 8080
#     to_port          = 8080
#     protocol         = "tcp"
#     cidr_blocks      = ["0.0.0.0/0"] # expose to all ips sice is for all user
#   }
# # the egress block handles rules for our resource within the vpc making requests or sending trafic outside the vpc to the internet. examples of such traffic is like when you want to install docker or other package in your EC2 instance, the binaries needs to be fectched or downloaded from the internet. another example, when we run an nginx image, the images has to be fetched from the dockerhub. these are requests made by the ec2 from your vpc to the internet  
#   egress {
#     from_port        = 0 # not restricting the request to any port out there is to set the value to 0
#     to_port          = 0 #same here
#     protocol         = "-1"  # not to restricct the protocal to a particular ones, we set this to "any" by using -1
#     cidr_blocks      = ["0.0.0.0/0"]  # any ip address out there
#   }

#   tags = {
#      Name = "${var.env_prefix}-custom-security-group"
#   }
# }


resource "aws_default_security_group" "myapp-default-security-group" {
  
  # description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id-for-EC2

		#so ingress block handles the incoming requests/traffics to access the resources in the VPC such as accessing the ec2 instance from your CLI 0r accessing the nginx on port 8080 on port 22. in these cases we are sending traffic/requests to the VPC to access the EC2 instance or the nginx in it
  #rules to expose port 22 for aceessing ec2 instance ourside
  ingress {
    description      = "Open port 22 for cli access to the EC2 instance"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    # cidr_blocks      = [var.my-ip] only that stated ip will be able to access the ip
    cidr_blocks      = ["0.0.0.0/0"]  #for all ips to be able to access the ec2
  }
#rules to expose port 22 for aceessing ec2 instance ourside
  ingress {
    description      = "Open port 8080 for access of the nginx server in the ec2 instance from a browser "
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # expose to all ips sice is for all user
  }
# the egress block handles rules for our resource within the vpc making requests or sending trafic outside the vpc to the internet. examples of such traffic is like when you want to install docker or other package in your EC2 instance, the binaries needs to be fectched or downloaded from the internet. another example, when we run an nginx image, the images has to be fetched from the dockerhub. these are requests made by the ec2 from your vpc to the internet  
  egress {
    description      = "rules to allow access of the resources inside the vpc to the internet"
    from_port        = 0 # not restricting the request to any port out there is to set the value to 0
    to_port          = 0 #same here
    protocol         = "-1"  # not to restricct the protocal to a particular ones, we set this to "any" by using -1
    cidr_blocks      = ["0.0.0.0/0"]  # any ip address out there
  }

  tags = {
    Name = "${var.EC2_env_prefix}-default-security-group"
  }
}

