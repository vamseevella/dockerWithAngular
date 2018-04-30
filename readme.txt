1. To build image
   Ex. docker build -t vamsee/angular-docker .

2. To list build images
   Ex. docker images

3. To run created image (or) To create containers
   Ex. docker run -p 4200:4200 -d vamsee/angular-docker
          (or)
       docker run -it \
         -v ${PWD}:/Users/vamsee/practicess/nodeDocker \
         -v /Users/vamsee/practicess/nodeDocker/node_modules \
         -p 4200:4200 \
         --rm \
         vamsee/angular-docker

   i). Use the -d flag to run the container in the background:
       Ex. docker run -d \
             -v ${PWD}:/Users/vamsee/practicess/nodeDocker \
             -v /Users/vamsee/practicess/nodeDocker/node_modules \
             -p 4200:4200 \
             --name angular-docker-container \
             vamsee/angular-docker

4. To list containers
   Ex. docker ps

5. To see the logs
   Ex. docker logs 8f17c295c482

   i). To test
        $ curl -i localhost:4200

6. Stop and then remove the container once done:(By using container 'NAMES' flag )
   Ex.
   $ docker stop angular-docker-container
   $ docker rm angular-docker-container

7. to remove folders (optional not needed)
   Ex.
       $ rm -rf *

8. Run the unit and e2e tests: (optional not needed)
   Ex.
      $ docker exec -it something-clever-container ng test --watch=false
      $ ng e2e

Docker-compose setup:-

1. To build && run docker image by using 'docker-compose'
   Ex. docker-compose up -d --build

2. Run the unit and e2e tests: (optional not needed)
   $ docker-compose run something-clever ng test --watch=false
   $ ng e2e

3. To stop running containers through docker-compose
   Ex. docker-compose stop


Essential commands about docker:-

1. To list running containers
   Ex. docker ps -aq

   (i) To stop running containers
   Ex. docker stop $(docker ps -aq)

2. Delete all docker containers
   Ex. docker rm $(docker ps -aq)

3. Delete all docker images
   Ex. docker rmi $(docker images -q)

4. To delete perticular image
   Ex. docker rmi some-image-id


CronTab in mac :-
  1. crontab -e
  2. crontab -l
  3. sudo cron restart
  4. log path --> /var/mail/vamsee
