#Imagem base Node.js
FROM node:20

# Definindo o diretório de trabalho dentro do contêiner
WORKDIR /app-node

# Copiando o arquivo package.json e instalando as dependências do projeto
COPY package*.json ./
RUN npm install

# Instalando o PM2 globalmente
RUN npm install pm2 -g

# Gerando o projeto Express e retornando "Hello World!"
RUN npx express-generator myapp && \
    cd myapp && \
    npm install && \
    echo "const express = require('express');" > app.js && \
    echo "const app = express();" >> app.js && \
    echo "const PORT = 3000;" >> app.js && \
    echo "app.get('/', (req, res) => { res.send('Hello World!'); });" >> app.js && \
    echo "app.listen(PORT, () => { console.log('Servidor Express rodando em http://localhost:${PORT}'); });" >> app.js && \
    npm uninstall express-generator && \
    rm -rf node_modules && \
    rm -f package-lock.json

# Expondo a porta 3000
EXPOSE 3000

# Comando para iniciar o servidor Express usando PM2
CMD ["pm2-runtime", "start", "myapp/app.js"]
