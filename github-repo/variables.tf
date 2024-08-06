variable "github_token" {}
variable "github_reponame" { default = "coffee-api" }
variable "github_branches" {
    type = list(string)
    default = [ "env/staging", "main" ]
}
variable "pg_password" {}
variable "pg_username" { 
    default = "postgres"
}