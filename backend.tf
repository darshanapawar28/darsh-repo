terraform {
  backend "s3" {
    bucket = "467.devops.candi"
    key    = "darshanapawar/devops-exam.tfstate"
    region = "ap-south-1"
  }
}

