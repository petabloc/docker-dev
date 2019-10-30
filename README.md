
# docker development environment for lawline application

Lawline dev environment setup on local ubnutu machine

 - Checkout of git branch on your machine 

     git clone https://github.com/petabloc/docker-dev.git

 - Install latest version of docker and docker-compose

      bash dockerInstllation.sh

 - Checkout of dev-ui and dev-api code in current repo

	Change the volume path in docker-compose.yml volume section of php and php_api
 
        File permission using chmod 777 dev-ui -R && chmod 777 dev-api -R

 - MySQL DB dump on local

    - Download furthed.sql.gz from s3 bucket list
    - Keep that sql dump furthed.sql file in current directory
    - Change the volume setting in the docker-compose file

 - Run docker compose command

   - Execute the --build command for first time or when you have change in docker file

        docker-compose up -d --build 

   - Create the container

        docker-compose up -d 

 - Add web container IP address into the your hosts file. You can find the ip address using following command 

	docker inspect web | grep "IPAddress"	

    EX : 172.19.0.6 docker.sixmilliondollarsite.com api.docker.sixmilliondollarsite.com

