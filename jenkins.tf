data "template_file" "user_data" {
  template = "${file("installjenkins.sh")}"
}

resource "aws_instance" "jenkins-hari" {
  ami             = "ami-0d058fe428540cd89"
  instance_type   = "t2.xlarge"
  subnet_id       = aws_subnet.hari-private-subnet.id
  security_groups = ["${aws_security_group.jenkins-security-group.id}", "${aws_security_group.bastion-security-roup.id}"]
  key_name        = "${aws_key_pair.wissen-hari.id}"
  user_data       = file("installjenkins.sh")

  tags = {
    Name = "jenkins-hari"
  }
}


output "jenkins_endpoint" {
  value = formatlist("/var/lib/jenkins/secrets/initialAdminPassword")
}