#Acessar o Shell do contêiner MySQL
Bash   
docker exec -it mysql-app mysql -uroot -p

#Depois crie o banco e o usuário:
SQL

#Criar volume para persistência:
Bash
mkdir teampass-docker
cd teampass-docker

#Crie um arquivo docker-compose.yml:
Bash
nano docker-compose.yml

#Cole o conteúdo:
YAML

#Se precisar parar o contêiner existente
Bash
docker compose down

#Se precisar recriar e inicia o contêiner
Bash
docker compose up -d


#Remover ou renomear o diretório install/ 
Bash
docker exec teampass-app rm -rf /var/www/html/install
