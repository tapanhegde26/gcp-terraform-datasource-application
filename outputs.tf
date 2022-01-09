output "ip" {
  value = google_compute_instance.vm_instance.network_interface.0.access_config.0.nat_ip
}

//output "script"{
  //value = google_compute_instance.vm_instance.metadata_startup_script
  //sensitive   = true
//}
