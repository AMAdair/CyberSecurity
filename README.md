# CyberSecurity
## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.
![Cloud Network Diagram](https://github.com/AMAdair/CyberSecurity/blob/main/Diagrams/Cloud%20Network%20Diagram.jpg?raw=true "Cloud Network Diagram")

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the various files may be used to install only certain pieces of it, such as Filebeat.

  - [Ansible Configuraion YAML](https://github.com/AMAdair/CyberSecurity/blob/main/Ansible/ansible_config.yml)
  - [Filebeat Playbook YAML](https://github.com/AMAdair/CyberSecurity/blob/main/Ansible/filebeat-playbook.yml)
  - [Installing ELK server YAML](https://github.com/AMAdair/CyberSecurity/blob/main/Ansible/install-elk.yml)
  - [Metricbeat Playbook YAML](https://github.com/AMAdair/CyberSecurity/blob/main/Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly monitored, in addition to restricting access to the network.
- By utlizing the load balancer you can rescrict and grant access to your server netwrok as needed, while maintaining operational oversight. 
- The use of the Jump Box with the SSH key in the docker container only adds an extra level of security, only one door in and out of the Cloud Network. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the data and system logs.
- "Filebeat is a lightweight shipper for forwarding and centralizing log data"
- "Metricbeat is a lightweight shipper that you can install on your servers to periodically collect metrics from the operating system and from services running on the server. Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash"

The configuration details of each machine may be found below.

| **Name**   | **Function** | **IP**   | **OS** |
|------------|--------------|----------|--------|
| Jump Box   | Gateway      | 10.0.0.4 | Linux  |
| Web 1      | Web Server   | 10.0.0.5 | Linux  |
| Web 2      | Web Server   | 10.0.0.6 | Linux  |
| Web 3      | Web Server   | 10.0.0.7 | Linux  |
| ELK Server | Monitor      | 10.1.0.4 | Linux  |
|            |              |          |        |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump Box machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 69.249.145.252

Machines within the network can only be accessed via the container within the Jump Box that contains the SSH key.
- The Elk server can be reached via the SSH key within the container found in the Jump Box. 10.0.0.4 ---> 10.1.0.4

A summary of the access policies in place can be found in the table below.

| **Name**   | **Publicly Accessable ** | **Allowed IPs** |
|------------|--------------------------|-----------------|
| Jump-Box   | Yes                      | 69.249.145.252  |
| Web-1      | no                       | 10.0.0.4        |
| Web-2      | no                       | 10.0.0.4        |
| Web-3      | no                       | 10.0.0.4        |
| Elk Server | no                       | 10.0.0.4        |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because this allows the user can scale these services widely, as-needed, across an entire IT organization. 

The playbook implements the following tasks:
- Intalls docker.io
- Installs python
- Ensures sufficient memory
- Downloads and Launches the ELk Container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker ps](https://github.com/eddie12frank/Frank/blob/main/Images/Docker%20PS.png "sudo docker ps")

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web-1,2, and 3

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat consists of two main components: inputs and harvesters. These components work together to tail files and send event data to the output that you specify.
- Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as Apache and MySQL


### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
-mkdir files within /etc/ansible
-git clone https://github.com/AMAdair/CyberSecurity.git
-cp filebeat-playbook.yml.txt /etc/ansible/files
-cp metricbeat-playbook.yml.txt /etc/ansible/files

- Run the playbook, and navigate to Kibana to check that the installation worked as expected.
Run the playbook, and navigate to kibana to check that the installation worked as expected.

cd /etc/ansible
ansible-playbook install_elk.yml
ansible-playbook install_filebeat.yml
ansible-playbook install_metricbeat.yml
Check Kibana to verify installation succeeded

website: http://http://20.211.2.85:5601//app/kibana
