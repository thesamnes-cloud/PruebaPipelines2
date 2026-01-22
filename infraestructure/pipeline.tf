resource "aws_codepipeline" "monorepo" {
  name     = "monorepo-pipeline"
  role_arn = aws_iam_role.pipeline_role.arn

  artifact_store {
    location = aws_s3_bucket.pipeline_artifacts.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = aws_codestarconnections_connection.github.arn
        FullRepositoryId = var.repo_name
        BranchName       = "main"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build-App-One"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]

      configuration = {
        ProjectName = aws_codebuild_project.apps["app-one"].name
      }
    }

    action {
      name             = "Build-App-Two"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]

      configuration = {
        ProjectName = aws_codebuild_project.apps["app-two"].name
      }
    }

    action {
      name             = "Build-App-Three"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]

      configuration = {
        ProjectName = aws_codebuild_project.apps["app-three"].name
      }
    }
  }
}

resource "aws_s3_bucket" "pipeline_artifacts" {
  bucket = "monorepo-pipeline-artifacts-${var.account_id}"

  force_destroy = true
}


resource "aws_codestarconnections_connection" "github" {
  name     = "github-monorepo-connection"
  provider_type = "GitHub"
}