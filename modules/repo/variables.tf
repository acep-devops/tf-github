variable "name" {
  type = string
}

variable "description" {
  default = ""
  type    = string
}

variable "visibility" {
  type    = string
  default = "private"
}

variable "license" {
  type    = string
  default = "mit"
}

variable "gitignore_template" {
  type    = string
  default = "Python"
}