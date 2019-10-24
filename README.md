# docker development environment for lawline application

Lawline dev environment setup on local ubnutu machine

 - Checkout of git branch on your machine 
     git clone https://github.com/petabloc/docker-dev.git

 - Install latest version of docker and docker-compose
      bash dockerInstllation.sh

 - Checkout of dev-ui and dev-api code in current repo

 - Run docker compose command

   - Execute the --build command for first time or when you have change in docker file
        docker-compose up -d --build 
   - Create the container
        docker-compose up -d
   





