# FYP_Docker_Jenkins_CI
Using Docker containers to improve the efficiency (success, time and cost) of a Continuous Integration environment.


### Overview

The aim of this project is to demonstrate how using Docker containerisation software can help increase the efficiency (success, time and cost) of a Continuous Integration (CI) software development environment.
The setup and architecture of a CI environment usually requires the resources of multiple server machines and as the scale of the software product grows, so does the CI environment. However, running such a network of machines comes with many costs e.g. the purchase and installation of the machines, the cost of employing an infrastructure engineering team for maintenance and the cost of replacing old unusable servers. From a build engineering point of view, all of these machines will ideally be identical in both the development environment and the production environment hosting the application. Unfortunately, it is highly unlikely that this will ever be true, meaning it cannot be guaranteed that the outcome of the various stages of CI will always be the same.

It is for the above reason I believe Docker could be used to help maintain similar development and production environments while also cutting down on the amount of machines required, therefore saving money. The huge number of hardware server machines could be reduced to just a few with each of them configured to host Docker containers.

There are a few ways to go about using Docker to replace hardware machines, although it can also depend on the CI environment in existence and the technology tools being used. For example, to use Atlasssian’s Bamboo CI software the Docker containers would need to be persistent (always running) due to how Bamboo searches for “Bamboo Agents” (machines) to run its CI build and test plans. An alternative would be to use Jenkins CI software. Jenkins would not require its Docker slaves to be persistent which would help further reduce the machine resource requirements to run Docker.

My plan for this project is to setup and configure an example of how Docker containers can be used to run CI build and test plans. I want to research how such a setup could help to reduce the cost of maintaining a CI environment like I mentioned above, how the concept of isolated containers can increase the success of CI plans compared with plans executed on a single hardware machine and how this increase in success would help to reduce the amount of time the CI process takes, from developer code check-in to ready for production.


### Objectives

- Demonstrate the use of Docker containers in a Continuous Integration environment.
- Investigate how using Docker containers will speed up the overall running time of the CI
process.
- Investigate how using Docker containers will increase the success of building and
testing a software product previously restricted by computer resources.
- Investigate how using Docker containers can reduce the cost running and maintaining a
CI environment.
- Increase my knowledge in technologies such as Docker, Mac OSX, CentOS, AWS S3
and Git version control.
- Increase my understanding of Continuous Integration as a method of incorporating
developer code changes into a software product being delivered to a customer.
