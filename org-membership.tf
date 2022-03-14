resource "github_membership" "developers" {
  for_each = toset(var.developers)
  username = each.key
  role     = "member"
}

resource "github_team_membership" "developers" {
  for_each = toset(compact(distinct(concat(var.developers, var.admins))))
  username = each.key
  team_id = github_team.developers.id
}

resource "github_membership" "admins" {
  for_each = toset(var.admins)
  username = each.key
  role     = "admin"
}

resource "github_team_membership" "admins" {
  for_each = toset(var.admins)
  username = each.key
  team_id = github_team.admins.id
}

resource "github_team_membership" "bots" {
  for_each = toset(var.bots)
  username = each.key
  team_id  = github_team.bots.id
}
