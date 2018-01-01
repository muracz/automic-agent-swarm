# Automic agent docker wrapper
Using this wrapper you can spawn a whole fleet of agenst with very little effort.

## Usage
Clone this repository.

Untar the agent binaries downloaded from Automic Download page into the following directory:
````
agents/unix_alpine/bins
````

Fill out the connection details in the docker-compose.yml

```
    environment:
      - cp=localhost:2217
      - system=AUTOMIC
      - prefix=alpine
```

Start a single agent to test it out:
```
docker-compose up -d
```
Scale up and down as much as you please:
```
docker-compose scale unix_alpine=100
```
## Notes
Based on few quick tests a EC2 instance with 2 Core and 4GB RAM can hold up to 350 Unix agents.

## Limitations
Keep in mind that on a standard kernel you will not be able to spawn more then 1024 agents on a single machine due to bridge limitations - [More on that](http://sseelam.blogspot.com/2015/10/how-to-run-more-than-1024-docker.html)
