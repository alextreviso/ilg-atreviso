resource "aws_db_instance" "db-master" {
    name                    = "${var.database_name}"
    identifier              = "db-${var.database_name}"
    
    engine                  = var.engine
    engine_version          = var.engine_version
    instance_class          = var.instance_class
    
    storage_type            = var.storage_type

    username                = var.db_username
    password                = var.db_password
    port                    = var.db_port

    vpc_security_group_ids  = [aws_security_group.sg-db.id]

    publicly_accessible     = var.publicly_accessible

    deletion_protection = var.deletion_protection

    tags = {
        Name = "db-${var.database_name}"
        env = var.env
    }
}
