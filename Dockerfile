#Imagem go para efetuar a compilação
FROM golang:latest as builder
#diretório de trabalho
WORKDIR /app
#enviando o código-fonte
COPY desafio.go /app 
#compilando
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags "-s -w" -o desafio desafio.go 

#imagem para execução
FROM scratch
#diretório de trabalho
WORKDIR /app 
#copiando o binário compilado 
COPY --from=builder /app/desafio ./ 
#executando
CMD ["/app/desafio"]