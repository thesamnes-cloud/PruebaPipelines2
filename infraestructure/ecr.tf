resource "aws_ecr_repository" "apps"{
    for_each = toset (var.apps)
    name = each.value

    image_scanning_configuration {
        scan_on_push = true
    }
}