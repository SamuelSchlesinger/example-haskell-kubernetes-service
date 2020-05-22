# Example Kubernetes Service in Haskell

Trying my best to learn Kubernetes

[Kubernetes v1.18 API Documentation](https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.18/)

# Notes

Service can create a virtual IP in cluster to act as a poor man's load
balancer. In particular, it creates a stable hostname that you can use
to access your dynamic set of pods, which may shift in IP identity.
Services don't generally expose anything outside of the cluster.

Services have NodePorts which are where they are exposed on the node.

# To Learn
Network topology (subnets, IP spaces, DNS, IP tables)

0. What is /etc/resolv.conf?
1. IP spaces, DNS
2. How does K8s manage its networking?
