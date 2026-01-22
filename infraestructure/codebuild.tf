resource "aws_codebuild_project" "apps" {
  for_each = toset (var.apps)

  name = "cb-${each.value}"
  service_role = aws_iam_role.codebuild_role.arn

  source {
    type = "CODEPIPELINE"
    buildspec = "${each.value}/buildspec.yml"
  }

  environment {
    compute_type = "BUILD_GENERAL1_SMALL"
    image = "aws/codebuild/standard:7.0"
    type = "LINUX_CONTAINER"
    privileged_mode = true

    environment_variable {
      name  = "ImageName"
      value = each.value
    }
  }

  artifacts {
    type = "CODEPIPELINE"
  }
}