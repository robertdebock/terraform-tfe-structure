output "workspace_urls" {
  description = "The names and URLs of the workspaces."
  value = tfe_workspace.workspaces[*].html_url
}
