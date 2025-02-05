# Overview
![Frame 185](https://github.com/user-attachments/assets/3896cd6f-0e68-441e-8825-f5dbc120a7e7)

# Dark Mode!
![Frame 186](https://github.com/user-attachments/assets/398360d2-cc8f-4058-a048-75f044a0f8c7)

# Different Scenarios!
![Frame 187](https://github.com/user-attachments/assets/58961e4a-cc69-4280-9dd6-46c8aaa7f508)


# <img src="https://upload.wikimedia.org/wikipedia/commons/0/05/Flag_of_Brazil.svg" alt="BR" height="20"/> GitHubPocket

Neste projeto foi desenvolvido um aplicativo para consultar a [API do GitHub](https://docs.github.com/en/rest/search?apiVersion=2022-11-28#search-repositories "API do GitHub") e retornar os repositórios mais populares de Swift, mostrando sua lista de pull requests. O projeto foi desenvolvido visando as boas práticas de programação e os conceitos fundamentais de aplicativos nativos de iOS.

## Solução adotada
### Organização de jornadas
A solução adota envolve um aplicativo Swift desenvolvido através de UIKit e que possui 3 cenas principais, representando a navegação do usuário pelo App: 
* Home: tela principal do aplicativo, onde é mostrada a lista de repositórios do GitHub dada requisição na url: ```https://api.github.com/search/repositories?q=language:Swift&sort=stars&page={page}```
* RepoDetail: tela apresentada ao usuário como um detalhe do repositório selecionado. O detalhe representa a lista de pull requests abertos para o repositório selecionado.
* PullRequestDetail: tela de detalhe do pull request, apresentada como modal e que carrega uma webview dado clique em determinado PullRequest da lista 
  
## Libs utilizadas
Para este projeto, as seguintes libs foram utilizadas:
* UIKit: Framework Swift para desenvolvimento de apps
* Snapkit: Lib para construção de constraints
* RXSwif: Lib para desenvolvimento de programação reativa
* Kingfisher: Lib para download de imagens através de uma URL 
  
## Arquitetura
A arquitetura utilizada para o projeto é a [Clean Swift](https://rubygarage.org/blog/clean-swift-pros-and-cons), que divide a responsabilidade do desenvolvimento através de: 
* ViewController -> Responsável por controlar o ciclo de vida da view e as possíveis interações do usuário com a mesma
* Interactor -> Responsável por gerenciar as interações do usuário. Através das interações aqui processadas, um resultado é apresentado ao usuário
* Worker -> Processa as interações. Aqui são realizadas as chamadas de API, por exemplo.
* Presenter -> Apresenta os resultados com base em cada interação
* View -> É o modelo visual que é controlado pela ViewController
* Router -> Gerencia as rotas que o usuário pode seguir dentro da controller

## Escolhas feitas
### Coordinator Pattern 
* Foi utilizado coordinator pattern para a organização e orquestração da navegação do app em um único arquivo. Facilitando identificar cada ponto de entrada em determinada jornada
### Documentação
* A maior parte da documentação foi realizada através das issues do Git
  
### Cocoapods
* Pods foram utilizados no projeto para otimizar o desenvolvimento, já que possibilitam a economia de linhas de código, arquivos e até mesmo oferecem ao app ganho de performance e orquestração de threads (como RXSwift por exemplo)

## Instruções para executar o projeto
Para rodar o projeto, as seguintes instruções devem ser seguidas:
1. Clone este repositório
2. Abra o projeto do repositório via terminal
3. Em seu terminal, rode o script ```sh rebuild_project.sh```

  <details>
  <summary> Clique para expandir... </summary>
  
  <img width="682" alt="rebuild_project" src="https://github.com/user-attachments/assets/04bfd8e3-87d9-40bd-9c34-4b2827c23cc4" />
 
  *Execução do comando no terminal*
  </details>

# <img src="https://upload.wikimedia.org/wikipedia/en/a/a4/Flag_of_the_United_States.svg" height="16" /> GitHubPocket

In this project, an application was developed to query the [GitHub API](https://docs.github.com/en/rest/search?apiVersion=2022-11-28#search-repositories "GitHub API") and return the most popular Swift repositories, showing their list of pull requests. The project was developed with a focus on best programming practices and the fundamental concepts of native iOS applications.

## Solution adopted
### Organization of journeys
The solution adopted involves a Swift application developed using UIKit and which has 3 main scenes, representing the user's navigation through the App: 
* Home: main screen of the application, where the list of GitHub repositories is shown given the request at the url: ```https://api.github.com/search/repositories?q=language:Swift&sort=stars&page={page} ```
* RepoDetail: screen presented to the user as a detail of the selected repository. The detail represents the list of open pull requests for the selected repository.
* PullRequestDetail: pull request detail screen, presented as modal and which loads a webview when clicking on a specific PullRequest in the list

## Used libraries
For this project, the following libs were used:
* UIKit: Swift framework for app development
* Snapkit: Lib for building constraints
* RXSwif: Lib for reactive programming development
* Kingfisher: Lib for downloading images via a URL

## Architecture
The architecture used for the project is [Clean Swift](https://rubygarage.org/blog/clean-swift-pros-and-cons), which divides development responsibility through: 
* ViewController -> Responsible for controlling the view's life cycle and possible user interactions with it
* Interactor -> Responsible for managing user interactions. Through the interactions processed here, a result is presented to the user
* Worker -> Processes interactions. API calls are made here, for example.
* Presenter -> Presents results based on each interaction
* View -> It is the visual model that is controlled by the ViewController
* Router -> Manages the routes that the user can follow within the controller

## Choices made
### Coordinator Pattern 
* Coordinator pattern was used to organize and orchestrate the app's navigation in a single file. Making it easier to identify each entry point in a given journey
### Documentation
* Most of the documentation was done through Git issues

## Steps to run the project
To run this project, the following instructions must be followed:
1. Clone this repository
2. Open the repository project via terminal
3. In your terminal, run the ```sh rebuild_project.sh``` script.
   
  

  <details>
  <summary> Click to expand... </summary>
  
   <img width="682" alt="rebuild_project" src="https://github.com/user-attachments/assets/04bfd8e3-87d9-40bd-9c34-4b2827c23cc4" />
 
  *Command execution on terminal*
  </details>


# Issues 
- [x] [#1 [FEATURE] Criar home do projeto](https://github.com/biaduque/GitHubPocket/issues/7)

- [x] [#2 [FEATURE] Criar tela de detalhe](https://github.com/biaduque/GitHubPocket/issues/9)

- [x] [#3 [FEATURE] Criar tela de visualização do pull request](https://github.com/biaduque/GitHubPocket/issues/10)

- [x] [#4 [FEATURE] Carregar foto de perfil dos usuários + paginação ](https://github.com/biaduque/GitHubPocket/issues/11)

- [x] [#5 [DEV] Cobertura de testes unitários do projeto](https://github.com/biaduque/GitHubPocket/issues/12)

- [x] [#6 [FEATURE] Criar componente para exibir quantida de FORKS e ESTRELAS de cada repositório](https://github.com/biaduque/GitHubPocket/issues/14)

- [x] [[DESIGN] Paleta de cores](https://github.com/biaduque/GitHubPocket/issues/15)

