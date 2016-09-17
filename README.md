Description
------------
A  project to create docker MongoDb containers and setup replicasets from any number of
containers with automated scaling by configuring and adding new containers
to any specified replica set automatically. The project can be used to setup
either local replica set or using docker-cloud.

Possible Uses
---------------
Great for quickly setting up test mongo replicaset containers for cloud and locally

Usage
-----
**local**  

**_Run/pull docker image_**<br>
To create a replica set with 1 primary and 2 secondary mongo Db's 
run the commands below but make sure that the --REPLICA_NAME
env variable remains the same for sibling Dbs in replica or else it will create 3 different 
primary Db's the default value is _ReplicaSet_<p>

> _Important: you must specify a shared volume and mount it to the container's
config directory [default: /var/config ] the example below mounts a host
directory <your_host_vol_path> to the container's config volume.  
You can use any of the docker recommended ways of sharing volumes between
containers i.e mounting a host directory or data volume container),just
you specify the correct path for the config volume (/var/config)._
 
>  _to change default config directory use the environment variable 
--CONFIG_DIR to setup your container. Make sure to update config volume
path to reflect your new --CONFIG_DIR_

add primary Db

    docker run -it -e REPLICA_NAME=<your_replica_name> -v <your_host_vol_path>:/var/config 
    --name <your_container_name_1> rollymaduk/mongo-replica:local


add another Db to the replica set<p>

    docker run -it -e REPLICA_NAME=<your_replica_name> -v <your_host_vol_path>:/var/config 
    --name <your_container_name_2> rollymaduk/mongo-replica:local

and another

    docker run -it -e REPLICA_NAME=<your_replica_name> -v <your_host_vol_path>:/var/config 
    --name <your_container_name_3> rollymaduk/mongo-replica:local
<p>

**_Use Docker Compose_**  

 setup your docker-compose.yml 
 
    version: "2"
    services:
      <your_container_name>:
         image: rollymaduk/mongo-replica:local
         environment:
           REPLICA_NAME: "<your_replica_name>"
         volumes:
         -  <your_host_vol_path>:/var/config
                
 
 run in command line  
 
    docker-compose up
    
 scale up to more containers
 
    docker-compose scale <your_container_name>=3
    
  
 



