# iGames

Realizei o projeto com a finalidade de me aprofundar mais no Flutter em questões como:
- Desenvolvimento de algumas features
- Consumo de API com o Flutter
- Gerenciamento de estado
- Arquitetura

## API
A API consumida na aplicação é a [RAWG Video Games Database API](https://api.rawg.io/docs/).

## O que a apliacação faz?

- Exibe jogos recomendados e os jogos com maior nota


![home_Igames](https://user-images.githubusercontent.com/55961939/142139294-24fc8ed9-6f7a-429c-889d-7208c05850b7.png)



- Possui tela com detalhes do jogo selecionado


![game_Igames](https://user-images.githubusercontent.com/55961939/142140605-3f3da24e-b41a-40e4-9967-ff08ef2c5208.png)


- Possibilidade de adicionar e remover jogos à sua playlist


![add_Igames](https://user-images.githubusercontent.com/55961939/142140089-5ff9f260-afca-4d7f-b48a-9db3db836f44.png)
![remove_Igames](https://user-images.githubusercontent.com/55961939/142139993-d9a89b9f-db57-46a7-afb6-827822af764d.png)
![myplaylist_Igames](https://user-images.githubusercontent.com/55961939/142139813-5a877af8-5154-427a-b0b1-3082a083609e.png)


## Arquitetura
O projeto possui três diretórios de maior importância. 
- design_system
- core
- features

Essa divisão foi feita visando seguir conceitos da Clean architeture, por isso cada diretórios tem funções segregadas.

O projeto utiliza o padrão BLoC, escolhi ele pois ao pesquisar sobre arquitetura em Flutter vi que é um padrão amplamente usado para o gerenciamento de estado, e me foi recomendado por desenvolvedores mais experientes no Flutter.

### Features

A idéia do diretório de features é que ele abrigue o conteúdo de UI.
Dentro dele existe uma pasta para cada feature da aplicação, dentro da pasta da feature específica, existe a tela, uma pasta para os widgets usados somente na feature em questão e uma pasta de constants, que tem o objetivo de diminuir a quantidade de textos na tela.
Também existe uma pasta shared dentro do diretório de features, dentro da shared existe uma pasta para widgets que são utilizados em mais de uma feature.

### Core

O diretório Core tem por função guardar modelos, rotas, Repositório, Injeção de Dependência, Service. Também possui uma pasta shared que abriga blocs e functions da aplicação que são utilizados em mais de uma feature. 
Evitando assim criar blocs desnecessários ou importa-los de uma feature para outra.

### Design System:

A pasta de Design System possui conteúdo de layout que é utilizado no app todo, como estilos de texto e cores, por exemplo. A pasta foi separada em um package, contribuindo para escalabilidade da aplicação.

## Observações:

- A tela de game_page está lançando um erro no console, tentei resolvê-lo com algumas sugestões de alteração que encontrei ao pesquisar, porém não consegui eliminá-lo e já estava no limite para entregar o teste, esta seria a primeira alteração se houvesse mais tempo
- Criei alguns testes, sendo eles para home page, repositório, e alguns para o game_bloc, o game_bloc não tem testes para o adicionar e o remover da playlist, este provavelmente seria um dos meus focos se houvesse mais tempo para desenvolver
