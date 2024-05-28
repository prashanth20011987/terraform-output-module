resource "aws_key_pair" "deployer" {
  key_name   = "privatekey"
  public_key = file("privatekey.pub")
}

resource "aws_instance" "excercise-3" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.deployer.key_name
  vpc_security_group_ids = ["sg-075b8de415d233bdf"]
  tags = {
    Name    = "key-pair-instance"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",  # Corrected permission command
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("privatekey")
    host        = self.public_ip
  }
}

output "public-ip-of-instance" {
  value = aws_instance.excercise-3.public_ip  # Corrected resource name
}

output "private-ip-of-instance" {
  value = aws_instance.excercise-3.private_ip  # Corrected resource name
}
