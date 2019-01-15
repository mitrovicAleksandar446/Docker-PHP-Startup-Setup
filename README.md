Prerequisites:
--------------
1. You must have Windows 10, Linux or Mac.
2. You must have git.
3. You must have Docker, Community edition and Docker Compose installed(For Mac it is already included in Docker installation).

Setup:
-------
To boot up Docker for you app, just run from directory root:

`bash ./setup.sh`

Then change your hosts file and add the following line:
`127.0.0.1	my-app.com`

In root, create directories **logs/myPHPs/nginx** to preview nginx error and access logs if needed.

Create your own .env file in root of the project, based on .env.example, to use some features (Optional)

!!! **IMPORTANT: Modify docker-compose.yml for adding your own PHP projects inside myPHPs folder and add nginx domains based on your needs** !!!

How-tos (navigate to this folder when executing):
-------------------------------------------------
1. To fire up the containers:
    - `docker-compose up -d`
2. To rebuild the containers (in case you change the Dockerfile):
    - `docker-compose up --build -d`
3. To SSH into the containers:
    - `docker exec -it my_php bash`
4. To run some command:
    - `docker exec my_php composer install --working-dir=/var/www/myPHPs/`


Import databases:
---------
1. Put the sql file into Docker/mysql/data/dumps
2. Access your mysql container `docker exec -it my_mysql bash`
3. `cd dumps/`
4. `mysql -uroot -proot my-db < THE_DB_FILE_NAME.sql`

Containers:
-----------
After you setup your environment, you will get the following containers:
- nginx 1.13.12 (container name: my_nginx)
- php fpm 7.2 (container name: my_php)
- mysql 5.7.24 (container name: my_mysql)

 
 ## Work with your user
 
 To work on my_php container as your user with sudo privileges, you can set it from Docker/.env file.
 
 Based on the values from .env.example, to have own user, add in Docker/.env:
 
 `USER_NAME={whatever_you_want}`
  
 `UID={UID_of_that_user}` (any number, besides 0, normally it will be 1000)
 
  Rebuild container if .env is changed:
  
  `docker-compose up -d --build`
  
  To return back to root user if needed, remove USER_NAME and UID from Docker/.env file and rebuild again.