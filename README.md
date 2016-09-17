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

`docker run -it --REPLICA_NAME <your_replica_name> --name <your_container_name_1> rollymaduk/mongo-replica:local`
<br>
add another container to the replica set<br>
`docker run -it --REPLICA_NAME <your_replica_name> --name <your_container_name_2> rollymaduk/mongo-replica:local`
<br>
and another<br>
`docker run -it --REPLICA_NAME <your_replica_name> --name <your_container_name_3> rollymaduk/mongo-replica:local`
<br><p>
**_Use Docker Compose_**




