resource "google_sql_database_instance" "postgres" {
  name             = "${var.project_id}-postgres-instance"
  database_version = "POSTGRES_13"
  region           = var.region

  settings {
    # Second-generation instance tiers are based on the machine type.
    tier = "db-f1-micro"

    # Since autoresize is enables, we are not specifying disk size.
    disk_autoresize = true
    disk_type = "PD_SSD"

    # The availability type of the Cloud SQL instance, 
    # high availability (REGIONAL) or single zone (ZONAL).
    availability_type = "ZONAL"
    location_preference {
        # The preferred compute engine zone
        zone = var.zone
    }

    ip_configuration {
        # Whether this Cloud SQL instance should be assigned a public IPV4 address.
        ipv4_enabled = true
    }

    backup_configuration {
      enabled = true
      start_time = "04:30"
    }

    # Maintenance window can be set as per reqiurement.
    # maintenance_window {
    #   day  = "1"
    #   hour = "4"
    # }
    
  }
}