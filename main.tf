resource "local_file" "app" {
    content = <<EOT
import os
import logging


# Get variables from environment created by Ansible playbook
name = os.environ.get('env_var_name')
colour = os.environ.get('env_var_colour')

# Configures log content
logging.basicConfig(level=logging.DEBUG, filename='poppy.log', filemode='a')

# Adds to log 
# Using global env variable
if 'env_var_name' in os.environ:
    logging.info("The environment variables were present") 
    logging.debug(f"{name} has a favourite colour. It is {colour}")
else:
    logging.warning("The environment variables were not present")
EOT
    filename = "hello_world/app.py"
}

resource "local_file" "playbook" {
    content = <<EOT
- hosts: localhost
  connection: local
  tasks:
  - include_vars: hello_vars.yaml
  - name: If variables were present
    Debug:
      msg: "The person is {{ name }} and the colour is {{ colour }}"
    when: name is defined
  - name: If variables were not present
    Debug:
      msg: "Variables were not present"
    when: name is undefined
  - name: Run the application
    shell: python app.py
    environment:
      env_var_name: "{{ name }}"
      env_var_colour: "{{ colour }}"
EOT
    filename = "hello_world/playbook.yaml"
}

resource "local_file" "hello_vars" {
    content = <<EOT
name: Poppy 
colour: green
EOT
    filename = "hello_world/hello_vars.yaml"
}

resource "local_file" "run" {
  content = <<EOT
#! /bin/bash

ansible-playbook playbook.yaml
EOT
  filename = "hello_world/run.sh"
}
