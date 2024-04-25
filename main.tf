# Create TFE organizations.
resource "tfe_organization" "default" {
  count = length(var.organizations)
  name  = var.organizations[count.index].name
  email = var.organizations[count.index].email
}

# Create a delay to allow the organizations to be created.
resource "time_sleep" "organization" {
  create_duration = "5s"
}

# Create TFE projects.
resource "tfe_project" "default" {
  count        = length(var.projects)
  name         = var.projects[count.index].name
  organization = var.projects[count.index].organization
  depends_on = [
    time_sleep.organization
  ]
}

# Create a delay to allow the projects to be created.
resource "time_sleep" "projects" {
  create_duration = "5s"
}

# Create TFE workspaces.
resource "tfe_workspace" "workspaces" {
  count        = length(var.workspaces)
  name         = var.workspaces[count.index].name
  organization = var.workspaces[count.index].organization
  project_id   = element([for p in tfe_project.default : p.id if p.organization == var.workspaces[count.index].organization && p.name == var.workspaces[count.index].project], 0)
  depends_on = [
    time_sleep.projects,
    tfe_organization.default,
    tfe_project.default
  ]
}
