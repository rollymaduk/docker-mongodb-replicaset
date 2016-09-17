Description
------------
A  project to create docker MongoDb containers and setup replicasets from any number of
containers with automated scaling by configuring and adding new containers
to any specified replica set automatically. The project can be used to setup
either local replica set or using docker-cloud.

Possible Uses
------------
Great for quickly setting up test mongo replicaset containers for cloud and locally

Usage
-----
**local**<br>
**_Run/pull docker image_**<br>
To create a replica set with 1 primary and 2 secondary mongo Db's 
run the commands below but make sure that the --REPLICA_NAME
env variable remains the same or else it will create 3 different 
primary Db's the default value is _ReplicaSet_<p>

add primary Db

`docker run -it -e REPLICA_NAME=<your_replica_name> --name <your_container_name_1> rollymaduk/mongo-replica:local`


add another Db to the replica set<p>

`docker run -it -e REPLICA_NAME=<your_replica_name> --name <your_container_name_2> rollymaduk/mongo-replica:local`

and another

`docker run -it -e REPLICA_NAME=<your_replica_name> --name <your_container_name_3> rollymaduk/mongo-replica:local`
<p>

**_Use Docker Compose_**




