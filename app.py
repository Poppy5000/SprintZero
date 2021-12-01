import os
import logging


# Get variables from environment created by Ansible playbook
name = os.environ.get('env_var_name')
colour = os.environ.get('env_var_colour')

# Configures log content
logging.basicConfig(level=logging.DEBUG, filename='poppy.log', filemode='a')

# Adds to log 
# Using global env variable
if 'env_var_name' and 'env_var_colour' in os.environ:
    logging.info("The environment variables were present") 
    logging.debug(f"{name} has a favourite colour. It is {colour}")
else:
    logging.warning("The environment variables were not present")
