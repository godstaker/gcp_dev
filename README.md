USAGE:
git clone https://github.com/godstaker/gcp_dev.git
Change all default values for variables to suit your requirements

For creating a service account to invoke Cloud run, use the service_acc
Use the cloud_run module if load balancer is not needed and cloud_run_w_lb, for cloud run with load balancer


Change values in the cred_init.sh file to suit your environment

chmod +x cred_init.sh

Run the cred_init.sh file

Run terraform init --> plan --> apply

Outstanding tasks:
Dynamic setup to deploy to a list of projects
