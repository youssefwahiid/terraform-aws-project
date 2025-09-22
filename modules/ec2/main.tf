resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.subnet_ids, count.index)
  key_name      = var.key_name
  vpc_security_group_ids = var.security_group_ids

  tags = {
    Name = format("%s-%d", var.name, count.index + 1)
  }

  # Remote-exec provisioner to install apache/proxy
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y apache2",
      "echo '<h1>hello from ${self.tags.Name}</h1>' | sudo tee /var/www/html/index.html",
      "sudo systemctl enable apache2",
      "sudo systemctl start apache2"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = var.ssh_user
      private_key = file(var.ssh_private_key_path)
      timeout     = "2m"
    }
  }

  # optionally use user_data instead of remote-exec for immutable infra
}
