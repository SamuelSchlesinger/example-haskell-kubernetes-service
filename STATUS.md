# Status of Effort

So far, I've been able to construct a minimal kubernetes deployment
consisting of 3 replicas of 2 pods each, service-a and service-b. These
are incredibly simple services, when you hit service-a on port 9000 at
/poke, it hits service-b on port 9001 at /poke and returns the HTTP
response shown by its Haskell Show instance. I can hit service-a by
exec-ing bash on service-a in one of the pods and it gets a 200 response
body from service-b.

## Next Steps

Now, I want to be able to hit this thing from the outside. I think that
involves making a service and exposing a port, but I am not sure how...
I could just use pods and use port-forwarding, but I want to do this in
a bit more of a systematic way so that it can be extended for larger systems
where we have a number of replicas backing one conceptual service.

## End Goals

I want to be able to easily construct microservices and network them in
nice ways and, ideally, deploy them to some cloud platform.
