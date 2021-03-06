# Sample Cloud Adoption Framework foundations landing zone

## globalsettings
global_settings = {
  #specifies the set of locations you are going to use in this landing zone
  location_map = {
    westeurope = "westeurope"
    northeurope = "northeurope"
  }

  #naming convention to be used as defined in naming convention module, accepted values are cafclassic, cafrandom, random, passthrough
  convention = "cafrandom"

  #Set of tags for core operations
  tags_hub = {
    owner          = "CAF"
    deploymentType = "Terraform"
    costCenter     = "1664"
    BusinessUnit   = "SHARED"
    DR             = "NON-DR-ENABLED"
  }

  # Set of resource groups to land the foundations
  resource_groups_hub = {
    westeurope = {
      HUB-CORE-SEC = {
        name     = "hub-core-sec-we"
        location = "westeurope"
      }
      HUB-OPERATIONS = {
        name     = "hub-operations-we"
        location = "westeurope"
      }
    }
    northeurope = {
      HUB-CORE-SEC = {
        name     = "hub-core-sec-ne"
        location = "northeurope"
      }
      HUB-OPERATIONS = {
        name     = "hub-operations-ne"
        location = "northeurope"
      }
    }
  }
}

## accounting settings
accounting_settings = {

  # Azure diagnostics logs retention period
  westeurope = {
    # Azure Subscription activity logs retention period
    azure_activity_log_enabled    = false
    azure_activity_logs_name      = "actlogs"
    azure_activity_logs_event_hub = false
    azure_activity_logs_retention = 365
    azure_activity_audit = {
      log = [
        # ["Audit category name",  "Audit enabled)"] 
        ["Administrative", true],
        ["Security", true],
        ["ServiceHealth", true],
        ["Alert", true],
        ["Recommendation", true],
        ["Policy", true],
        ["Autoscale", true],
        ["ResourceHealth", true],
      ]
    }
    azure_diagnostics_logs_name      = "diaglogs"
    azure_diagnostics_logs_event_hub = false

    #Logging and monitoring 
    analytics_workspace_name = "caflalogs-we"

    ##Log analytics solutions to be deployed 
    solution_plan_map = {
      NetworkMonitoring = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/NetworkMonitoring"
      },
      ADAssessment = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ADAssessment"
      },
      ADReplication = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ADReplication"
      },
      AgentHealthAssessment = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/AgentHealthAssessment"
      },
      DnsAnalytics = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/DnsAnalytics"
      },
      ContainerInsights = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ContainerInsights"
      },
      KeyVaultAnalytics = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/KeyVaultAnalytics"
      }
    }
  }
  northeurope = {
    # Azure Subscription activity logs retention period
    azure_activity_log_enabled    = false
    azure_activity_logs_name      = "actlogs"
    azure_activity_logs_event_hub = false
    azure_activity_logs_retention = 365
    azure_activity_audit = {
      log = [
        # ["Audit category name",  "Audit enabled)"] 
        ["Administrative", true],
        ["Security", true],
        ["ServiceHealth", true],
        ["Alert", true],
        ["Recommendation", true],
        ["Policy", true],
        ["Autoscale", true],
        ["ResourceHealth", true],
      ]
    }
    azure_diagnostics_logs_name      = "diaglogs"
    azure_diagnostics_logs_event_hub = false

    #Logging and monitoring 
    analytics_workspace_name = "caflalogs-ne"

    ##Log analytics solutions to be deployed 
    solution_plan_map = {
      NetworkMonitoring = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/NetworkMonitoring"
      },
      ADAssessment = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ADAssessment"
      },
      ADReplication = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ADReplication"
      },
      AgentHealthAssessment = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/AgentHealthAssessment"
      },
      DnsAnalytics = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/DnsAnalytics"
      },
      ContainerInsights = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/ContainerInsights"
      },
      KeyVaultAnalytics = {
        "publisher" = "Microsoft"
        "product"   = "OMSGallery/KeyVaultAnalytics"
      }
    }
  }
}

## governance
governance_settings = {
  westeurope = {
    #current code supports only two levels of managemenr groups and one root
    deploy_mgmt_groups = false
    management_groups = {
      root = {
        name          = "caf-rootmgmtgroup"
        subscriptions = []
        #list your subscriptions ID in this field as ["GUID1", "GUID2"]
        children = {
          child1 = {
            name          = "tree1child1"
            subscriptions = []
          }
          child2 = {
            name          = "tree1child2"
            subscriptions = []
          }
          child3 = {
            name          = "tree1child3"
            subscriptions = []
          }
        }
      }
    }

    policy_matrix = {
      #autoenroll_asc          = true - to be implemented via builtin policies
      autoenroll_monitor_vm = true
      autoenroll_netwatcher = false

      no_public_ip_spoke     = false
      cant_create_ip_spoke   = false
      managed_disks_only     = true
      restrict_locations     = false
      list_of_allowed_locs   = ["westeurope", "northeurope"]
      restrict_supported_svc = false
      list_of_supported_svc  = ["Microsoft.Network/publicIPAddresses", "Microsoft.Compute/disks"]
      msi_location           = "westeurope"
    }
  }
  northeurope = {}
}

## security 
security_settings = {
  #Azure Security Center Configuration 
  enable_security_center = false
  security_center = {
    contact_email       = "email@email.com"
    contact_phone       = "9293829328"
    alerts_to_admins    = true
    alert_notifications = true
  }
  #Enables Azure Sentinel on the Log Analaytics repo
  enable_sentinel = true
}
