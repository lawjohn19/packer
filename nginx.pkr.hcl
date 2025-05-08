packer {

required_plugins {
  amazon = {
    version = ">= 1.3.6"
    source  = "github.com/hashicorp/amazon"
  }
}
}

source "amazon-ebs" "nginx-linux-2" {
  ami_name      = "nginx-linux-2"
  source_ami    = "ami-0f88e80871fd81e91"
  instance_type = "t2.micro"
  region        = "us-east-1"
  ssh_username  = "ec2-user"

}

build {
  sources = ["source.amazon-ebs.nginx-linux-2"]

  provisioner "shell" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]
  }
}


