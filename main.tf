
data "google_compute_image" "flask_image" {
  family  = var.image_family
  project = var.image_project
}

data "template_file" "webapp" {
   template = file("${path.module}/template/install_flask.tpl")
 }

data "terraform_remote_state" "developmentwsdata" {
  backend = "local"

  config = {
    path = "/Users/c5281159/terraform-associate-tutorials/devopsjunction/terraform.tfstate.d/test/terraform.tfstate"
  }
}

// Terraform plugin for creating random ids
resource "random_id" "instance_id" {
  byte_length = 8
}


// A single Compute Engine instance
resource "google_compute_instance" "vm_instance" {
  name         = "flask-vm-${random_id.instance_id.hex}"
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = data.google_compute_image.flask_image.self_link
    }
  }

// metadata_startup_script = data.template_file.webapp.rendered
metadata_startup_script = data.terraform_remote_state.developmentwsdata.outputs.script
//  metadata_startup_script = data.external.install_configure_flask.rendered

//  metadata = {
  //  ssh-keys = "tapanaws2021:${file("~/.ssh/id_rsa.pub")}"
//  }


  network_interface {
    network = google_compute_network.vpc_network.name

    access_config {
      // Include this section to give the VM an external ip address
    }
  }
}

