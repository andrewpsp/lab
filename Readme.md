# A Lab 


Developing on fast and secure upstream Kubernetes
Designed for developing Kubernetes Workloads locally
[Learn more about microk8s](https://microk8s.io)



# Getting Started
 
Using the upstream K8s with barebone installion inlcuding apiserver 
Stack includes : 
-  Kube DNS  
-  Dashboard  

#  Instantiate cluster via Vagrantfile 

`vagrant up`
This will build a local Kubernetes image that uses the certified snap a full implmenation of the K8s technology (No toys) configuration deployments in the corrensponding directories of the project.



# TODO 

- Deploy multi-tier application 
- Implement component instrumentation 
- Update EFK stack ; fluentd to fluent bit
- Add Bastion host 