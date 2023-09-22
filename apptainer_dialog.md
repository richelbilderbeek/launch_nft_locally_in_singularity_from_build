# Apptainer Slack dialog

## Richel Bilderbeek

I have two Apptainer containers, made from two Docker containers. 
With the Docker containers, 
they can talk to each other using a virtual network 
by using a name instead of an IP address. 
How do I reproduce this in my Apptainer containers, without sudo rights?

Here is how I start the first container (from this script, inspired by the Apptainer documentation on 'Network virtualization'):

```
singularity run --fakeroot --net --network=none --hostname=backend nf-tower_backend-latest.sif &
```

This seems to partially work, as I get as output:

```
13:20:36.868 [main] INFO  io.micronaut.runtime.Micronaut - Startup completed in 8191ms. Server Running: http://localhost:8080
```

However, I would like to see that backend is a known interface in my local virtual network. And that is part of the problem: I do not know how to see the virtual network created by Apptainer.

So,
How to make two Apptainer containers talk to each other using a virtual network and names for IP addressed?
How can I see/investigate the Apptainer virtual network set up?
Thanks and cheers, Richel Bilderbeek


## Pontus Freyhult

Best is normally not to use the network virtualisation, 
but let it use host networking instead, 
do you feel that presents an issue here?

## Richel Bilderbeek

Unsure what 'use host networking instead' means exactly. I am sure I intend to deploy the two containers in an environment without internet access (aka Bianca).
Does that help us help me :slightly_smiling_face: ?

## Pontus Freyhult

"host networking" means "not in a new network namespace", meaning something that has the same network view as "the host". This would be the same as an application run outside of container technologies saw.
Reasons for not doing so would be e.g. if there are port conflicts, lack of configurability (to stop from listening on all IPs) or if it's a security feature (not accessible to others).

## Richel Bilderbeek

Sounds like something I cannot do in an environment with restricted internet access (aka Bianca)...?
So, how do I do what I need to do :slightly_smiling_face: ?

## Pontus Freyhult

So, restricted outgoing traffic doesn't concern this. Since it's on an already restricted system, it's another indication you don't need to use the networking features.

## drdaved

There is only very limited virtual networking supported in non-setuid apptainer.  If you can just use the host’s networking as Pontus says, it would be a lot easier.   In your case it would be just localhost communication via listening on unique unprivileged ports, so the containers can communicate with each other.

## drdaved

As the document you referred to above says, most of the virtual networking is restricted to the root user by default, although the administrator of a setuid-mode installation of Apptainer may permit certain users to use specific configurations.  So if you’re not root and have no setuid-mode installation, it is not available.

## Richel Bilderbeek

Thanks 
@Pontus Freyhult
 and 
@drdaved
 for this insights! I appreciate it :-)

