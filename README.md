
# docker development environment for lawline application

Lawline dev environment setup on local ubnutu machine

 - Checkout of git branch on your machine 

     git clone https://github.com/petabloc/docker-dev.git

 - Install latest version of docker and docker-compose

      bash dockerInstallation.sh

 - Checkout of dev-ui and dev-api code in current repo

	Change the volume path in docker-compose.yml volume section of php and php_api
 
        File permission using chmod 777 dev-ui -R && chmod 777 dev-api -R

 - MySQL DB dump on local

    - Download furthed.sql.gz from s3 bucket list
    - Create furthed folder ( mkdir furthed ) 
    - Keep that sql dump furthed.sql file in furthed dir
    - Change the volume setting in the docker-compose file

 - Run docker compose command

   - Execute the --build command for first time or when you have change in docker file

        docker-compose up -d --build 

   - Create the container

        docker-compose up -d 

 - Add web container IP address into the your hosts file. You can find the ip address using following command 

	docker inspect web | grep "IPAddress"	

    EX : 172.19.0.6 docker.sixmilliondollarsite.com api.docker.sixmilliondollarsite.com

 - Execute the blow command to insert some of the rows for docker dev environment
	
	docker exec -i db /usr/bin/mysql -u root --password=root furthered < dmlQueries.sql

 - Following Code changes on your local 

	- Create the docker.php file and add below lines ( ../vendor/furthered/bionic/config/docker.php )

		"<?php return ['api' => [ 'base_uri' => 'http://api.docker.sixmilliondollarsite.com', 'auth' => ['faster', 'stronger'], ],'redis' => ['host' => 'redis','port' => 6379,],'encrypt' => ['consumers' => ['ui'],],];?>"

  	- Replace or change the below line in file ( ../vendor/furthered/bionic/src/Config.php )  with 1st line to 2nd line
		 #self::$config = require __DIR__ . '/../config/' . self::environment() . '.php';
		  self::$config = require __DIR__ . '/../config/docker.php';


  - .Env file changes are following 

  	APP_ENV=docker
	DB_CONNECTION=mysql
	DB_HOST=db
	DB_PORT=3306
	DB_DATABASE=furthered
	DB_USERNAME=furthered
	DB_PASSWORD="WY6dfWI&MQL*#"
	REDIS_HOST=redis
	REDIS_PORT=6379



