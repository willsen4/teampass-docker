#Criar banco e usuário 
bash
MariaDB
docker exec -it mariadb_instance mariadb -uroot -p

MySQL
docker exec -it mysql-app mysql -uroot -p

#Depois crie o banco e o usuário:
sql

CREATE DATABASE teampassdb CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'teampass_user'@'%' IDENTIFIED BY 'sua_senha_forte';
GRANT ALL PRIVILEGES ON teampassdb.* TO 'teampass_user'@'%';
FLUSH PRIVILEGES;
EXIT;

#Criar volume para persistência (opcional, mas recomendado)
bash
mkdir teampass-docker
cd teampass-docker

#Criar container do Teampass
Você pode fazer isso pelo Portainer (via UI), ou criar o container via docker run ou docker-compose. Aqui está um exemplo com
docker-compose.yml
bash
nano docker-compose.yml

#Criar "Secure Path" 
Bash
sudo mkdir -p /opt/teampass-secure
sudo chmod 700 /opt/teampass-secure
sudo chown -R 1000:1000 /opt/teampass-secure

#Se precisar descobrir o ID do usuário
Bash
docker inspect teampass-app | grep -i user

#Criar rede Teampass
Bash
docker network create teampass_network

#Conectar a rede
MariaDB
Bash
docker network connect teampass_network mariadb_instance

MysSQL
Bash
docker network connect teampass_network mysql-app

#Para inspecionar a rede
MariaDB
docker inspect mariadb_instance | grep -A 5 "Networks"

MySQL
docker inspect mysql-app | grep -A 5 "Networks"

docker inspect teampass-app | grep -A 5 "Networks"

#Depois execute:
bash
docker compose up -d



