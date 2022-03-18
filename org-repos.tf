module "repository" {
  for_each           = { for repo in var.repository : repo.name => repo }
  source             = "./modules/repo"
  name               = each.value.name
  description        = each.value.description
  visibility         = each.value.visibility
  license            = each.value.license
  gitignore_template = each.value.gitignore_template
}