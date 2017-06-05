# world-of-rations-db

## Getting Started

Clone the repository

`git clone https://github.com/barend-erasmus/world-of-rations-db.git`

Change to cloned directory

`cd ./world-of-rations-db`

Build docker image from dockerfile

`docker build --no-cache -t worldofrations_mysql ./`

Run docker image

`docker run -d -p 3306:3306 --name wor-db -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=worldofrations -e MYSQL_USER=worldofrations_user -e MYSQL_PASSWORD=worldofrations_password -t worldofrations_mysql`