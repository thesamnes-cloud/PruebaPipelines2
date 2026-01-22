<<<<<<< HEAD
resource "aws_ecr_repository" "apps"{
    for_each = toset (var.apps)
    name = each.value

    image_scanning_configuration {
        scan_on_push = true
    }
=======
resource "aws_ecr_repository" "apps"{
    for_each = toset (var.apps)
    name = each.value

    image_scanning_configuration {
        scan_on_push = true
    }
>>>>>>> fbc32b35a070a2f7cb96be8a5436b2c5f91fb0d2
}