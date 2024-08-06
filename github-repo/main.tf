resource "github_repository" "coffee_api" {
    name        = var.github_reponame
    description = "Coffee API repo"

    visibility = "public"
    gitignore_template = "Python"

}

resource "github_branch" "all" {
  repository = github_repository.coffee_api.name
  count = length(var.github_branches)
  branch     = var.github_branches[count.index]
}


resource "github_branch_default" "default"{
  repository = github_repository.coffee_api.name
  branch     = var.github_branches[0]
}

resource "github_branch_protection" "branches_protect" {
  repository_id = github_repository.coffee_api.name
  count = length(var.github_branches)
  pattern = var.github_branches[count.index]

}

resource "github_actions_secret" "pg_password_secret" {
  repository       = github_repository.coffee_api.name
  secret_name      = "PG_PASSWORD"
  plaintext_value  = var.pg_password
}

resource "github_actions_variable" "pg_username_variable" {
  repository       = github_repository.coffee_api.name
  variable_name    = "PG_USERNAME"
  value            = var.pg_username
}