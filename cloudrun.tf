module "cloud_run_serviceaccount" {
  source               = "./modules/service_acc"
  service_account_name = "cloudrun"
  roles                = ["roles/compute.viewer"]
}

module "hello_world" {
  source       = "./modules/cloud_run"
  service_name = "helloworld"
  members      = "serviceAccount:cloudrun@av24042017.iam.gserviceaccount.com"
}