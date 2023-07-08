# Desafio Full Cycle - Curso de Arquitetura de Software
Esse desafio é muito empolgante principalmente se você nunca trabalhou com a linguagem Go!
Você terá que publicar uma imagem no docker hub. Quando executarmos:

docker run <seu-user>/fullcycle

Temos que ter o seguinte resultado: Full Cycle Rocks!!

LINK Dockerhub: https://hub.docker.com/r/thiagodz7/golang/tags 

Imagem otimizada para 1.6mb


Como Otimizei a imagem? me baseei na imagem de um integrante do github Jgustavo, e fiz essa explicação usando um pouco de Chat GPT para deixar mais claro o que foi feito:

# FROM golang:alpine AS builder

Essa linha define a imagem base para a primeira etapa da construção da imagem.
Utiliza a imagem "golang:alpine", que contém o ambiente de desenvolvimento Go no sistema operacional Alpine Linux.
A palavra-chave AS builder é usada para dar um nome a essa etapa da construção.

# WORKDIR /go/src/app

Essa linha define o diretório de trabalho dentro do contêiner, onde o código-fonte do aplicativo será copiado e onde os comandos subsequentes serão executados.
Nesse caso, o diretório de trabalho é definido como "/go/src/app".

# COPY app /go/src/app

Essa linha copia o conteúdo do diretório local chamado "app" para o diretório de trabalho dentro do contêiner.
Isso pressupõe que existe um diretório chamado "app" no mesmo diretório do Dockerfile, contendo o código-fonte do aplicativo.

# RUN CGO_ENABLED=0 go build -o /app FulCycle.go

Essa linha executa um comando durante a construção da imagem.
Define a variável de ambiente CGO_ENABLED como 0 para desabilitar a ligação com bibliotecas C.
Usa o comando go build para compilar o arquivo "FulCycle.go" (assumindo que ele está presente no diretório de trabalho).
O parâmetro -o /app especifica o nome e o local do arquivo binário resultante da compilação. Neste caso, será criado um arquivo chamado "app" na raiz do contêiner.

# FROM scratch

Essa linha define uma nova imagem base para a segunda etapa da construção da imagem.
A imagem "scratch" é uma imagem vazia, sem um sistema operacional subjacente.
Essa etapa é usada para criar uma imagem mínima que contenha apenas o binário do aplicativo.

# COPY --from=builder /app /app

Essa linha copia o binário do aplicativo da imagem da etapa anterior (chamada "builder") para a imagem atual.
O parâmetro --from=builder especifica a origem da cópia, referindo-se à imagem da etapa "builder".
Copia o arquivo binário chamado "app" do diretório raiz da imagem da etapa "builder" para o diretório raiz da imagem atual.

# CMD [ "/app" ]

Essa linha define o comando padrão a ser executado quando um contêiner baseado nessa imagem for iniciado.
Nesse caso, o comando especificado é ["/app"], o que significa que o binário do aplicativo será executado dentro do contêiner.

Em resumo, esse Dockerfile compila um aplicativo Go em um contêiner usando uma imagem base do Go. Ele cria uma imagem intermediária que contém o código-fonte do aplicativo, compila-o em um binário chamado "app" e, em seguida, cria uma imagem mínima que contém apenas esse binário. Quando um contêiner é iniciado a partir dessa imagem, o binário do aplicativo é executado automaticamente.

