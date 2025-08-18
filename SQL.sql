-- Acessar o shell do MySQL
docker exec -it mysql-app mysql -uroot -p

CREATE DATABASE teampass_db CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER 'teampass_user'@'%' IDENTIFIED BY 'sua_senha_forte';
GRANT ALL PRIVILEGES ON teampass_db.* TO 'teampass_user'@'%';
FLUSH PRIVILEGES;
EXIT;