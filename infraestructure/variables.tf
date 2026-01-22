<<<<<<< HEAD
variable "region" {
    description = "AWS region"
    type = string
    default     = "us-east-2"
}

variable "account_id" {
    description = "AWS Accpunt ID"
    type = string
}

variable "apps" {
    description = "App from monorepo"
    type = list (string)

    default =[
        "app-one",
        "app-two",
        "app-three"
    ]
}

variable "repo_name" {
    description = "Nombre del repo GitHub"
    type = string
=======
variable "region" {
    description = "AWS region"
    type = string
    default     = "us-east-2"
}

variable "account_id" {
    description = "AWS Accpunt ID"
    type = string
}

variable "apps" {
    description = "App from monorepo"
    type = list (string)

    default =[
        "app-one",
        "app-two",
        "app-three"
    ]
}

variable "repo_name" {
    description = "Nombre del repo GitHub"
    type = string
>>>>>>> fbc32b35a070a2f7cb96be8a5436b2c5f91fb0d2
}