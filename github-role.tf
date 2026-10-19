resource "aws_iam_role" "github_deploy" {
  name = "pipewright-github-deploy"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Federated = aws_iam_openid_connect_provider.github.arn
      }
      Action = "sts:AssumeRoleWithWebIdentity"
      Condition = {
        StringEquals = {
          "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          "token.actions.githubusercontent.com:sub" = "repo:ahmad-abdulmajid@257265087/cloudpipeline-app@1417397183:ref:refs/heads/main"
        }
      }
    }]
  })
}
