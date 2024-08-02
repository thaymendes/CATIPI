# CatAPI

Este é um aplicativo iOS que sugere raças de gatos com base nas preferências dos usuários. O aplicativo consome uma API externa para obter informações sobre as raças de gatos e permite que os usuários filtrem e descubram novas raças de acordo com suas preferências.

## Funcionalidades

- **Tela Inicial:** Exibe uma imagem de título, uma imagem de subtítulo e um botão para navegar para a tela de sugestões.
- **Sugestões de Qualidades:** Exibe uma lista com qualidades que o usuario busca em um felino.
- **Favoritos:** Permite aos usuários salvar suas raças favoritas para acesso rápido.
- **Detalhes da Raça:** Exibe informações detalhadas sobre uma raça de gato selecionada.
- **Persistência de Dados:** Utiliza Core Data para armazenar os favoritos localmente.

## Arquitetura

O aplicativo segue o padrão de arquitetura MVVM (Model-View-ViewModel) para uma melhor separação de responsabilidades e facilidade de manutenção.

- **Model:** Contém as definições das estruturas de dados e classes relacionadas à API e persistência.
- **View:** Contém as definições das views e componentes de UI.
- **ViewModel:** Contém a lógica de apresentação e interação entre a Model e a View.

## Como Rodar o Projeto

1. Clone o repositório:
    ```sh
    git clone https://github.com/SeuUsuario/iFoodCatAPI.git
    ```

2. Navegue até o diretório do projeto:
    ```sh
    cd CatAPI
    ```

3. Abra o projeto no Xcode:
    ```sh
    open CatAPI.xcodeproj
    ```

4. Compile e rode o projeto no simulador ou dispositivo.

