resource "aws_instance" "instance" {
  ami = "ami-042e8287309f5df03"
  count = 5
  associate_public_ip_address = true
  instance_type = "t2.micro"
  key_name = "Ansible"
  source_dest_check = true
  tags = {
    Name = "Client${count.index}"
  }
  vpc_security_group_ids = [
    aws_security_group.instance.id,
  ]
}
# aws_security_group.instance:
resource "aws_security_group" "instance" {
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description = ""
      from_port = 0
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "-1"
      security_groups = []
      self = false
      to_port = 0
    },
  ]
  ingress = [
    {
      cidr_blocks = [
        "23.23.73.1/32",
        "172.31.16.120/32",
        "83.240.158.54/32",
        ]
      description = ""
      from_port = 22
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = []
      self = false
      to_port = 22
    },
    {
      cidr_blocks = [
        "23.23.73.1/32",
        "172.31.16.120/32",
        "83.240.158.54/32",
        ]
      description = ""
      from_port = 80
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = []
      self = false
      to_port = 80
    },
    {
      cidr_blocks = [
        "23.23.73.1/32",
        "172.31.16.120/32",
        "83.240.158.54/32",
        ]
      description = ""
      from_port = 443
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = []
      self = false
      to_port = 443
    },
        {
      cidr_blocks = [
        "23.23.73.1/32",
        "172.31.16.120/32",
        "83.240.158.54/32",
        ]
      description = ""
      from_port = 3306
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      protocol = "tcp"
      security_groups = []
      self = false
      to_port = 3306
    },
]
}
