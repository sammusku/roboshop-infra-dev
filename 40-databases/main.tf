resource "aws_instance" "mongodb" {
    ami = local.ami_id
    instance_type = var.instance_type
    subnet_id = local.database_subnet_ids
    vpc_security_group_ids = [local.mongodb_sg_id]


    tags = merge (
        {
          Name = "${var.project}-${var.environment}-mongodb"
     },
     local.common_tags
    )
}

resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id
  ]
  connection {
    type = "ssh"
    user = "ec2-user"
    password = "DevOps321"
    host = aws_instance.mongodb.private_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"              #localfile-path
    destination = "/tmp/bootstrap.sh"    #remotefile-path on remote machine
   }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/bootstrap.sh",        #giving execute permission 
        "sudo sh /tmp/bootstrap.sh mongodb"
    ]
    
    }
  }
