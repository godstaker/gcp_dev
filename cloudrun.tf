module "cloud_run_serviceaccount" {
  source = "./gcp_dev/modules/service_acc"
  service_account_name = "cloudrun"
  roles = "roles/run.invoker"

}

module "hello_world" {
  source = "./gcp_dev/modules/cloud_run"
  service_name = "hello_world"
}

module "service_account_binding" {
  source = "./gcp_dev/modules/cloud_iam_binding"
  cloud_run_service_name = module.hello_world.name
  service_account_email = "cloudrun"

  depends_on = [ module.hello_world]
}