# docker develepment enviornment for lawline application

#Lawline Dev enroviment setup on local ubnutu machine

 - Checkout of git branch on your machine 
    git clone https://github.com/petabloc/docker-dev.git

 - Intsall leteast version of docker and docker-compose 
   bash dockerInstllation.sh

 - Checkout of Dev-ui and Dev-api code in current repo

 - Run docker compose command

   - Execute the --build command for first time or when you have change in docker/compose file
     docker-compose up -d --build 
   - Create the container 
     docker-compose up -d





