# Status of Effort

Currently, there are two services, x-service and y-service. x-service contains two containers, each running an
HTTP server, one which is hit when you hit x-service and that one hits the other. y-service has one container in
it, and it hits x-service and returns what it says, or an exception if it cannot. Currently, this is working, so
I have a proof of concept setup that can be run in the `sgs` namespace anywhere and work successfully.

## End Goals

I want to be able to easily construct microservices and network them in
nice ways and, ideally, deploy them to some cloud platform.
