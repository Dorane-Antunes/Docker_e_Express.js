#!/bin/bash

# Atualiza os repositórios e instala possíveis atualizações do sistema.
atualizacoes(){
    echo -e "\e[31m -- Atualizando repositórios... --\e[0m"
    sudo apt-get update

    echo -e "\e[31m -- Atualizando o sistema... --\e[0m"
    sudo apt-get upgrade
}

# Instala pacotes essenciais, para correta configuração do Docker e garantia de conexões seguras e autenticadas, instala o Docker e Docker Compose.
instalacao(){
    echo -e "\e[31m -- Atualizando pacotes essenciais... --\e[0m"
    sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

    echo -e "\e[31m -- Instalando o Docker... --\e[0m"
    sudo apt install docker.io

    echo -e "\e[31m -- Instalando o Docker Compose... --\e[0m"
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

#Chama e executa as funções.
atualizacoes
instalacao

#Verifica o status da instalação.
if [ $? -ne 0 ]; then
    echo -e "\e[31m Erro na atualização ou instalação do sistema \e[0m"
else
    echo -e "\e[31m Instalação concluída com sucesso \e[0m"

fi