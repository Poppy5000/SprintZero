#### HelloWorld it's Poppy

<details><b><summary>What does the application do? </b></summary>
<p>

>* It shows the name of the user and their favourite colour on screen
>* Shows an error message if data is missing
>* Allows users to access a dashboard of visualisations of the data

</p>
</details>

<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>

<details><b><summary>How does the application do this? </b></summary>
<p>

>* Two variables are stored in a yaml file
>* An Ansible playbook:
  >* Calls the variables file
  >* Checks whether variables exist
  >* Displays an appropriate message to the screen
  >* Sets environment variables using the content of the variables file
  >* And runs the application  
>* The application is written in python
  >* It checks for variable data held in os.environ (which was set in the playbook run)
  >* And uses the logging module to store the result in a separate file
>* Terraform creates the files in a new location
>* Filebeat passes the log content to Elasticsearch
>* And analytics can be viewed in a Kibana dashboard, using a saved search

</p>
</details>

<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>

<details><b><summary>Prerequisites: </b></summary>
<p>

> - [ ] Terraform installed
> - [ ] Git installed
> - [ ] Ansible installed
> - [ ] Filebeat installed
> - [ ] A correctly configured filebeat.yml file
> - [ ] ElasticSearch and Kibana access

</p>
</details>

<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>

<details><b><summary>How to run the application: :running_woman:</b></summary>
<p>
  
> On the command line:
> - [ ] Filebeat setup -e (to configure filebeat using the filebeat.yml)
> - [ ] Filebeat -e (to launch filebeat)
> - [ ] Clone this repository
> - [ ] Terraform init
> - [ ] Terraform plan (to check the build will work)
> - [ ] Terraform apply
> - [ ] CD into hello_world folder
> - [ ] ./run.sh

> View the results in Kibana using the dashboard hello-world-poppy

</p>
</details>

<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>

<details><b><summary>Possible improvements and questions :monocle_face:</b></summary>
<p>

>* Run ansible from terraform for more automation
>* Add .DS_Store and .tfstate files to gitignore
>* Use a secret.tfvars file instead of copying in the variables file with terraform
>* Copy required files instead of adding the contents of each to the main.tf file
>* Rewrite the app.py to cater for all possible messages, based on variable input
>* How would I print to screen from the app.py (the Print command didn't work)?
>* How can I test missing or null variables without manually deleting them from the playbook before a test run?


</p>
</details>

<p>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>

