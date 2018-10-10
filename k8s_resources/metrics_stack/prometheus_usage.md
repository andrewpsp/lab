## Prometheus Service setup 


## Metrics Dashboard


* 		Proactive monitoring
* 		Cluster visibility and capacity planning
* 		Trigger alerts and notification
* 		Metrics dashboards



## Custom reosurces 
 - `Prometheus`  - defines setup to run in k8s cluster, opens to configure `replication`, persistent storage, and `Alertmanagers` 
 - For each resource use, the operator deploys a configured `StatefulSet` in the same namespace. Pro Pods are configured to mount a `secret` which holds the configuration for Promethesus

- `ServiceMonitor` define how a dynamic set of services should be monitored. Defined with labal selections. D
- For best practice define convention on how metrics are exposed and build new services following the defined conventions. 
- Within Kubernetes Endpoint objects populated bt a `Service` object. Service objects discovers `Pod` by a label selector and adds to the Endpoints object
- endpoints refer to prometheus , while Endpoints refer K8s objects 
- Fine grain controls via `ServiceMonitorNamespaceSelector` & `namespaceSelector`


- AlertManager defines desired setup for cluster `replication` and `persistent storage` . Configured to inlcude a `Secret` in the alertmanager.yaml

- `PrometheusRule` defines desired Prometheus rule to be consumed by Pro instances

- Alerts and Recording rules can be saved and applied with out restart. 