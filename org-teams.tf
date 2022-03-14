resource "github_team" "admins" {
    name = "admins"
    description = "The admin team for acep devops"
    privacy = "closed" 
}

resource "github_team" "developers" {
    name = "developers"
    description = "The developer team for acep devops"
    privacy = "closed" 
}

resource "github_team" "bots" {
    name = "bots"
    description = "The bots for acep devops"
    privacy = "closed" 
}