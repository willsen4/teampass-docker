# Instalar teampass com Docker
## TeamPass é um gerenciador de senhas de código aberto projetado para equipes e organizações, permitindo o armazenamento seguro e colaborativo de senhas e informações sensíveis. 

### Criando os diretórios / volumes (Dados persistentes)
````Bash
sudo mkdir -p /data/teampass3/pw
sudo mkdir -p /data/teampass3/configs
sudo mkdir -p /opt/teampass-secure
````
-----------
### Ajustando permissões do GLPI
````Bash
sudo chown -R 33:33 /data/teampass3
sudo chmod -R 775 /data/teampass3
sudo chown -R 33:33 /opt/teampass-secure
sudo chmod -R 775 /opt/teampass-secure
````
----------
## Criar banco de dados no Cliente MySQL já instalado no Docker

-----------
### Acessar o Shell do contêiner MySQL
````Bash   
docker exec -it mysql-app mysql -uroot -p
````
---------
### Depois crie o banco e o usuário:
SQL
### Usar os comandos que estão no arquivo SQL.sql
--------
### Criar volume para persistência:
````Bash
mkdir teampass-docker
````
````Bash
cd teampass-docker
````
--------
### Crie um arquivo docker-compose.yml:
````Bash
nano docker-compose.yml
````
----------
### Cole o conteúdo:
YAML

### Salve e feche o arquivo. (Em nano, pressione Ctrl+X, depois Y e Enter).
-------------
### Criar rede Teampass
````Bash
docker network create teampass_network
````
---------
### Conectar a rede MySQL
````Bash
docker network connect teampass_network mysql-app
````
-----------
### Para inspecionar a rede
````Bash
docker inspect mysql-app | grep -A 5 "Networks"
````
````Bash
docker inspect teampass-app | grep -A 5 "Networks"
````
------------
### Depois execute:
````Bash
docker compose up -d
````
-------------
### Na página de configuração do Teampass vai pedir "Secure Path" onde vai ficar as senhas criptografadas do Teampass fora do www padrão, colocar /var/www/html, pois esse caminho já foi criado no compose.

## Acessar o Teampass
### Abra seu navegador e vá até http://<IP_da_VM_ou_endereço_externo>:8090/install
### Siga o assistente de instalação para completar o setup do Teampass. Ele vai usar o banco já configurado.
### Acesse com usuário "admin" e a senha criada.
### Vai solicitar essas informações:
* Database connection
* Host: mysql-app
* Database name : teampass_db
* Login: teampass_user
* Password: sua_senha_forte
* Port: 3306
* Table prefix: teampess_
-------------
### Se precisar parar o contêiner existente
````Bash
docker compose down
````
-----------
### Se precisar recriar e inicia o contêiner
````Bash
docker compose up -d
````
------------
## Pós-instalação CRÍTICA (Segurança!)
### MUITO IMPORTANTE: Após a instalação bem-sucedida do TeamPass, você DEVE remover ou renomear o diretório install/ dentro do contêiner do TeamPass para evitar que qualquer pessoa acesse o assistente de instalação novamente.

### Execute este comando no SSH da sua VM:
````Bash
docker exec teampass-app rm -rf /var/www/html/install
````

# FIM!





