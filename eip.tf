#Elastic IP 
/*An EIP is a public IP address that can be assigned to an instance or load balancer. EIPs can be used to 
make your instances accessible from the internet.*/
resource "aws_eip" "elastic_ip" {
  tags = {
    Name = "elastic-ip"
  }
}