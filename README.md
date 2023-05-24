## Desafio Docker 01 
Este projeto é o resultado do primeiro desafio do módulo de Docker da FullCycle.

#
## Breve histórico

Inicialmente, criei o programa GO para imprimir o texto no console. Nessa etapa não houve nada muito difícil. O próprio tutorial do site da linguagem foi mais que o suficiente.

Em seguida, precisei criar a imagem do docker. Crei o primeiro arquivo `dockerfile` (Dockerfile.01) neste repositório. Usei a imagem `golang:alpine3.18`. O arquivo é bem simples: Baixa a imagem, copia o código fonte para o conteiner, executa os comandos de compilação e execução do binário. Porém, essa imagem ficou com 281MB! A boa notícia é que funcionou.

Como o objetivo era criar uma imagem 100x menor, pensei bastante e lembrei de já ter lido sobre a imagem `scratch`, que é ideial para esse caso. Nessa versão (Dockerfile.02), simplesmente copiei o binário da minha máquina para a imagem e criei o comando para sua execução. Resultado: a imagem ficou com 1.85MB.

A ideia de copiar o binário não foi muito legal, então decidi usar uma imagem do Go para compilar o código fonte (arquivo `desafio.go`) e usar o binário resultante em uma imagem derivada de `scratch`. Essa é a versão final.

Ou era, até que eu notei que o binário sozinho tinha 1.8MB. Ou seja, quase toda a totalidade da imagem. Resolvi pesquisar um pouco sobre redução do tamnho de binários e encontrei algumas flags de compilação e consegui que o binário ficasse com 1.2MB. 

Agora sim, declaro como versão final.

#
## Docker Hub
Com a versão final "eleita" fiz o push para o dockerhub:
1. docker login
2. docker push manalista/fullcycle-rocks

#
## Github
Após tudo concluído, enviei o código para o Github.

#paz