resource "github_repository" "repo" {
  name                   = var.name
  description            = var.description
  visibility             = var.visibility
  has_issues             = true
  has_wiki               = true
  has_projects           = true
  allow_merge_commit     = false
  allow_squash_merge     = true
  allow_rebase_merge     = false
  delete_branch_on_merge = false
  has_downloads          = false
  archived               = false
  auto_init              = true
  license_template       = var.license
  gitignore_template     = var.gitignore_template
  archive_on_destroy     = true
  vulnerability_alerts   = true
}

resource "github_branch_protection" "default" {
  repository_id = github_repository.repo.node_id
  pattern       = "main"

  depends_on = [
    github_repository.repo,
  ]

  required_pull_request_reviews {
    dismiss_stale_reviews      = true
    require_code_owner_reviews = false
  }

}

resource "github_team_repository" "developers_access" {
  team_id    = "developers"
  repository = github_repository.repo.name
  permission = "push"
}
resource "github_team_repository" "bot_access" {
  team_id    = "bots"
  repository = github_repository.repo.name
  permission = "admin"
}
resource "github_team_repository" "admin_access" {
  team_id    = "admins"
  repository = github_repository.repo.name
  permission = "admin"
}