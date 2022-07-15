# tf-github

This repo manages the ACEP DevOps Organization using [terraform](https://www.terraform.io/)'s
[github provider integration](https://registry.terraform.io/providers/integrations/github/latest/docs)

## Org Memebership & Teams

The current design of the Organization is that there are
 three teams, that dictate membership to the Organization.

- admins
- developers
- bots

Upon adding a user to the `terraform.tfvars.json` file under the correct team,
 an invite will automatically be sent for the user and they will be added to
 the corrisponding team.

### Adding a new user(s)

Adding new user(s) to the organization should be done following these steps:

1. Create a new branch
2. Edit the `terraform.tfvars.json` file to include user(s) to existing teams
3. Add changes to `CHANGELOG.md`
4. Open a PR with a short description of what the changes are
5. Pass GitHub Actions
6. Merged by Admin

### Adding new teams

If a new team is needed they can be added to the `org-teams.tf` file
Following these guidelines:

1. Create a new branch
2. Edit the `org-teams.tf` file to include a new resource block following the
   format below

    ```terraform
    resource "github_team" "new_team" {
    name        = "new_team"
    description = "Short description of team"
    privacy     = "closed"
    }
    ```

3. Edit the `org-membership.tf` file to include two new resource blocks outlined
   below:

    ```terraform
    resource "github_membership" "new_team" {
    for_each = toset(var.new_team)
    username = each.key
    role     = "member"
    }

    resource "github_team_membership" "new_team" {
    for_each = toset(compact(distinct(concat(var.new_team, var.admins))))
    username = each.key
    team_id  = github_team.new_team.id
    }
    ```

4. Edit the `terraform.tfvars.json` file to include a new key for your team with
   the value a list of users to be added
5. Add changes to `CHANGELOG.md`
6. Open a PR with a short description of what the changes are
7. Pass GitHub Actions
8. Merged by Admin

## Org Repos

The Organization manages the repositories using our Terraform Module. If adding
a new repository a new repository object can be added under the `repository` key
in the `terraform.tfvars.json` file. The current configurable and required
 settings on the repostiory object are:

| Setting | Type | Default |
| --------- | --------- | --------- |
| name | string | nil |
| description | string | "" |
| visibility | string | "private" |
| license | string | "mit" |
| gitignore_template | string | "Python" |

The full list of configurable settings are available in the module and new
variables can be added on request.

By default all repos have branch protection enabled and require reviews.

### Adding a new repository

Adding new repository to the organization should be done following these steps:

1. Create a new branch
2. Edit the `terraform.tfvars.json` file to include the new repository
3. Add changes to `CHANGELOG.md`
4. Open a PR with a short description of what the changes are
5. Pass GitHub Actions
6. Merged by Admin

## Changes

If you would like to add a user to the Org, add a user to a team,
 or create a new managed repository. The following is required:

1. Create a new branch
2. Edit the `terraform.tfvars.json` to include your proposed changes
3. Add changes to `CHANGELOG.md`
4. Open a PR confirming these actions
5. Pass GitHub Actions
6. Merged by Admin

If a change is not merged in a timely manner please reach out to
[@dayne](https://github.com/dayne)(dayne@alaska.edu)
