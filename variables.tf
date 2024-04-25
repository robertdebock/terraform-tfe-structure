variable "organizations" {
  description = "A list of organizations"
  default = []
  type = list(object({
    name  = string
    email = string
  }))
  validation {
    condition = length(var.organizations) > 0
    error_message = "At least one organization must be defined."
  }
  validation {
    condition = can(regex("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$", var.organizations[0].email))
    error_message = "The email address is not valid."
  }
}

variable "projects" {
  description = "A list of projects"
  default = []
  type = list(object({
    name        = string
    organization = string
  }))
}

variable "workspaces" {
  description = "A list of workspaces"
  default = []
  type = list(object({
    name         = string
    organization = string
    project      = string
  }))
}
