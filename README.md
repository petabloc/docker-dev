
# Docker development environment for lawline application

Lawline dev environment setup on local  machine

 - Install latest version of docker and docker-compose ( This will run only ubuntu OS )

		 bash dockerInstallation.sh

 - MAC docker and docker-compose installation document click on [URL](https://docs.docker.com/docker-for-mac/install/ "URL")
	You can check the docker version using 
				docker --version
				docker-compose --version

 - Checkout of git branch on your machine

     	git clone https://github.com/petabloc/docker-dev.git

 - Checkout of dev-ui and dev-api code in current repo

      - Change the volume path in docker-compose.yml volume section of php, php_api and File permission using :

				chmod 777 dev-ui -R && chmod 777 dev-api -R

 - MySQL DB dump on local

    - Download furthed.sql.gz from s3 bucket list 
		https://lawline-dev.s3.amazonaws.com/sql-import-files/furthered_2017-11-08.sql
    - Create furthed folder ( mkdir furthed )
    - Keep that downloaded sql dump as furthed.sql file in furthed dir
    - Change the volume setting in the docker-compose file

 - Run docker compose command

   - Execute the --build command for first time or when you have change in docker file

			docker-compose up -d --build

   - Create or up the container.

			docker-compose up -d

 - Map your local IP address to the domain which your going to use in  your hosts file. To find the ip of your local computer :

        ifconfig

    EX : 192.186.11.6 docker.sixmilliondollarsite.com api.docker.sixmilliondollarsite.com

 - Execute the command to insert some of the rows for docker dev environment

		docker exec -i db /usr/bin/mysql -u root --password=root furthered < dmlQueries.sql

- Following Code changes on your local
 - Create the docker.php file and add below lines
   - ../vendor/furthered/bionic/config/docker.php

   		<?php return ['api' => [ 'base_uri' => 'http://api.docker.sixmilliondollarsite.com', 'auth' => ['faster', 'stronger'], ],'redis' => ['host' => 'redis','port' => 6379,]];?>

 - Replace or change the below line in file ( ../vendor/furthered/bionic/src/Config.php )  with 1st line to 2nd line

               #self::$config = require __DIR__ . '/../config/' . self::environment() . '.php';
                 self::$config = require __DIR__ . '/../config/docker.php';

 - .Env file changes are following in both dev-api and dev-ui

		   APP_ENV=docker
		   DB_CONNECTION=mysql
		   DB_HOST=db
		   DB_PORT=3306
		   DB_DATABASE=furthered
		   DB_USERNAME=furthered
		   DB_PASSWORD="********"

		   REDIS_HOST=redis
		   REDIS_PORT=6379

		   ELASTICSEARCH_HOST=elasticsearch
		   ELASTICSEARCH_PORT=9200

	Note : Replace the DB_PASSWORD="........" with acutal furthered  DB dev password

-  Execute the following command for product index in elasticsearch container

			docker exec -it php_api php artisan search : index:products --refresh=1
