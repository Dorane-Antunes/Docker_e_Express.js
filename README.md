# Configuração de Ambiente de Desenvolvimento com Docker e Express.js

### Descrição:
Este repositório contém um Dockerfile que cria uma imagem baseada no Node.js para executar um servidor Express em um contêiner Docker. O servidor responde com "Hello World!" na porta 3000.

#### Como usar:

1. Clone este repositório:
```
  git clone https://github.com/Dorane-Antunes/Docker_e_Express.js.git
```

2. Navegue até o diretório clonado:
```
  cd Docker_e_Express.js
```
3. Verifique se possui o Docker instalado:
```
  docker -v
```
Se o Docker estiver instalado, você verá a versão atual do Docker  
Caso contrário, execute o script instalacao_docker_e_docker_compose.sh
```
  bash instalacao_docker_e_docker_compose
```
5. Construa a imagem Docker:
```
  docker build -t nome-da-imagem .
```
4. Execute o contêiner a partir da imagem criada:
```
  docker run -p 3000:3000 nome-da-imagem
```

**Agora você pode acessar o servidor Express em http://localhost:3000/**

#### Detalhes do Dockerfile

- Utiliza a imagem base do Node.js (versão 20).  
- Define o diretório de trabalho dentro do contêiner como /app-node.  
- Copia o arquivo package.json e instala as dependências do projeto.
- Instala o PM2 globalmente.  
- Gera o projeto Express e configura um endpoint que retorna "Hello World!".  
- Expõe a porta 3000 do contêiner.  
- Inicia o servidor Express usando o PM2 como comando padrão.  
