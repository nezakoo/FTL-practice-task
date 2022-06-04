# FTL-practice-task
The test task for FTL
______

# Description:

Developers at TheFintechLab want to be able to easily test their applications in an environment similar to production. So, they want the ability to run a simple command to create the infrastructure and deploy their service.

# Requirements:

- use infrastructure as code (ansible, terraform) to create CLI command(s) that deploy load balancer and a compute instance behind it in any public cloud (e.g. AWS, GCP, Azure);
- deploy web server in a docker container on the compute instance that serves a "hello world" page (index.html - `<h1>Hello World</h1>`);
- only official images from Docker Hub should be used;
- image should be based on Alpine-Linux;
- web server should be python (e.g. flask, gunicorn);
- docker Container for web server should not be pre-built - Install on the server web server (e.g. apache, nginx) which proxies HTTP (HTTPS would be a plus) to the application container;
- CLI Returns a URL to "hello world" page;
- keep a history of work through GitHub/GitLab commits.

# Deliverables:

1. Link to sources in GitHub or GitLab.
2. Clear documentation to get this running on any machine.

=======
You will need to have preinstalled:
1. Python
2. Pip
3. Terraform
# Solution:
A little preparations:
`pip3 install -r ./ansible/requirements.txt`
`ansible-galaxy collection install -r ./ansible/collection_requirements.yml`

1. To create the infrastructure you will need to export the AWS keys to your shell env
2. Also you will need to generate the ssh keypair for the access to the instance `ssh-keygen FTL-app-key`
3. Make sure that the key has the correct path in `key_pair.tf`
4. Make sure that Subnet for SSH for the Security Group in `network.tf` is correct
5. Run `terraform apply in terraform folder`
6. Run `ansible-playbook playbook.yaml -i ./inventory/aws_ec2.yaml -l tag_Application_application -u ubuntu --key ../../FTL-app-key`
