module "structure" {
  source = "../.."

  organizations = [
    {
      name = "robert-org"
      email = "robert@example.com"
    },
    {
      name = "sjors-org"
      email = "sjors@example.com"
    }
  ]

  projects = [
    {
      name        = "prod"
      organization = "robert-org"
    },
    {
      name         = "non-prod"
      organization = "robert-org"
    },
    {
      name         = "non-prod"
      organization = "sjors-org"
    },
    {
      name         = "prod"
      organization = "sjors-org"
    }
  ]

  workspaces = [
    {
      name         = "prod"
      organization = "robert-org"
      project      = "prod"
    },
    {
      name         = "dev"
      organization = "robert-org"
      project      = "non-prod"
    },
    {
      name         = "uat"
      organization = "robert-org"
      project      = "non-prod"
    },
    {
      name         = "tst"
      organization = "robert-org"
      project      = "non-prod"
    },
    {
      name         = "prod"
      organization = "sjors-org"
      project      = "prod"
    },
    {
      name         = "dev"
      organization = "sjors-org"
      project      = "non-prod"
    },
    {
      name         = "uat"
      organization = "sjors-org"
      project      = "non-prod"
    },
    {
      name         = "tst"
      organization = "sjors-org"
      project      = "non-prod"
    }
  ]
}

output "workspace_urls" {
  value = module.structure.workspace_urls
}
