# Terraform Enterprise Structure

This Terraform module can be used to create:

- organizations
- projects
- workspaces

All `workspaces` must exist in a `project`, and all `projects` must exist in an `organization`. These three entities must be defined using this module.
