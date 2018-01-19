
# The Marathon frame does not support InverseOffer

 
From the marathon code, it looks there were some code (at least come defines) for InverseOffer https://github.com/mesosphere/marathon/blob/29d035d5c259668c68e849ca31f8d94125213f60/src/main/proto/mesos/mesos.proto#L1931 , not sure if the code itself really handles it.
 
A look into https://jira.mesosphere.com/browse/MARATHON-3216  thread and the marathon source code, I am confirming marathon does not handle the the InverseOffer at all. 
And I don't really see that the Windows agent node needs to do anything at all, I believe this maintenance is a mode operating between the mesos master and a framework. 
 
In the case of marathon, since InverseOffer is still not supported (https://jira.mesosphere.com/browse/MARATHON-3216) because its  only available through httpv1 api, which marathon is still not using (https://jira.mesosphere.com/browse/MARATHON-7659).  
 
Given the marathon is the key framework running on top of Mesos and http://mesos.apache.org/documentation/latest/maintenance/  has indepth description about the mataintenance. i am  really suprised marathon still not supporting it....
 
From the number of "todo" comments that I see in the code, I'm not surprised that there are features that are incomplete.
 
# InverseOffer Example Framework

Interestingly, I found a example framework that you might be able to try to see if our above understanding (no need to do anything in the windows agenet node)  is accurate: 
https://github.com/kaysoky/InverseOfferExampleFramework  
it looks it's something ready for testing.
 
it's an OSX setup but it looks like it's useful....
 
It looks like it have more that you need -- it setups/starts master and salves nodes
 
https://jira.mesosphere.com/browse/MARATHON-3043 
 
This issue was closed (a week ago) - that means Marathon is using mesos Http v1 API, which has InverseOffer support. One less blocker  but still no InverseOffer support in the Marathon yet. :(
 
https://jira.mesosphere.com/browse/MARATHON-7659 shows the request is accepted but not resovled yet...
 
 
# Joe's deprecated PR on [Added example framework for handling inverse offers](https://reviews.apache.org/r/50010/diff/3#index_header)
