variable "admins" {
  type        = list(string)
  description = "A list of admins"
}

variable "developers" {
  type        = list(string)
  description = "A list of developers"
}

variable "bots" {
  type        = list(string)
  description = "A list of bots"
}

variable "repository" {
  type = list(object({
    name               = string
    description        = string
    visibility         = string
    license            = string
    gitignore_template = string
  }))
}