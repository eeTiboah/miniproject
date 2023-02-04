


resource "tls_private_key" "main" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.ssh_key
  public_key = tls_private_key.main.public_key_openssh
}

resource "local_file" "ssh_key" {
  content         = tls_private_key.main.private_key_pem
  filename        = "${var.ssh_key}.pem"
  file_permission = "0400"
}


resource "aws_instance" "altschool_instances" {
  ami                         = "ami-06878d265978313ca"
  associate_public_ip_address = true
  for_each                    = aws_subnet.subnets
  subnet_id                   = each.value.id
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  instance_type               = "t2.micro"
  key_name                      = var.ssh_key


  provisioner "local-exec" {
    command = "echo '${self.public_ip}' >> ./host-inventory"
  }
}

resource "null_resource" "ansible-playbook" {
  provisioner "local-exec" {
    command = "ansible-playbook --private-key ${var.ssh_key}.pem site.yml"
  }

  depends_on = [aws_instance.altschool_instances]
} 