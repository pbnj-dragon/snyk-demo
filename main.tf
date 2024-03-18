terraform {
  required_version = ">=1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5"
    }
  }
}

provider "aws" {}

data "aws_iam_policy_document" "foo" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "foo" {
  policy = data.aws_iam_policy_document.foo.json
}
