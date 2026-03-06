locals {
      ami_id = data.aws_ami.devops

      common_tags = {
        project = var.project
        environment = var.environment
        terraform = true
      }
      
      database_subnet_ids = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0] # converting stringList to list and retrieved  az-1a. 
      mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
}
    
