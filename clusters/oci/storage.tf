resource "oci_core_volume" "shared_50gb_oci_core_volume" {
  availability_domain = "CQhm:SA-SANTIAGO-1-AD-1" # Availability Domain for Chile, if you are in another zone you should review this 
  compartment_id      = var.compartment_id
  display_name        = "50gb_shared"
  freeform_tags = {
    "sredevops" = "true"
  }
  is_auto_tune_enabled = "false"
  size_in_gbs          = "50"
  vpus_per_gb          = "10"
  # COnfigure the volume to be shared with other instances and mount it in the /mnt/shared folder
  # This is a good practice to share data between instances
  connection {
    type = "paravirtualized"
    shared = true
    mount_point = "/mnt/shared"
  }
  lifecycle {
    ignore_changes = [
      size_in_gbs,
      vpus_per_gb,
      display_name,
      availability_domain
          ]
  }
}
