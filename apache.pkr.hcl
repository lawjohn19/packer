packer {
  required_plugins {
    amazon = {
    version = ">= 1.3.6"
    source  = "github.com/hashicorp/amazon"
  }
}
}

source "amazon-ebs" "apache-ubuntu" {
  ami_name      = "apache-ubuntu-22.04"
  source_ami    = "ami-0f9de6e2d2f067fca"
  instance_type = "t2.micro"
  region        = "us-east-1"
  ssh_username  = "ubuntu"

}
build {
  sources = ["source.amazon-ebs.apache-ubuntu"]

  provisioner "shell" {
    script = "./apache.sh"
  }
}  