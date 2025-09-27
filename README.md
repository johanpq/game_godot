# EcoHero

## Tópicos

- [Definição do Projeto](#definição-do-projeto)
- [Funcionalidades](#funcionalidades)
- [Diagrama de Classes](#diagrama-de-classes)
- [Diagrama de Casos de Uso](#diagrama-de-casos-de-uso)
- [Requesitos](#requesitos)
- [Tecnologias](#tecnologias)
- [Equipe de Desenvolvimento](#equipe-de-desenvolvimento)
- [Licença](#licença)

## Definição do Projeto

O projeto consiste na criação de um jogo 2D single player, em visão top-down, voltado para crianças, com foco em conscientizar e incentivar o uso dos Objetivos de Desenvolvimento Sustentável (ODS). Será desenvolvido na engine **Godot**, utilizando **GDScript**, aproveitando sua leveza, praticidade e caráter open source. O objetivo é entregar um **MVP funcional e interativo** para o público infantil.

## Funcionalidades

- **Tutorial:** Sistema de tutorial para o jogador possa aprender os comandos basicos do game.
- **Mecanica de NPC:** Mecanica de NPC's, onde o jogador pode interagir para iniciar missões.
- **Exploração:** Mapa com diversos detalhes e atividades para o jogador explorar.
- **Combate:** Mecanica de combate contra inimigos.

## Diagrama de Classes

![Diagrama de Classes](/images/diagrama.jpeg)

O diagrama de classes do projeto mostra as principais entidades e suas interações, como 'PlayerCharacter', 'Npc' e 'Items'.

## Diagrama de Casos de Uso

![Diagrama de Casos de Uso](/images/Diagrama%20de%20caso%20de%20uso.png)

O diagrama de casos de uso apresenta as principais funcionalidades disponíveis aos atores e suas interações com o sistema. O jogador pode controlar o personagem principal, interagir com NPCs para receber missões, coletar e utilizar itens no cenário e acompanhar o progresso do jogo. Além disso, o sistema gerencia automaticamente eventos como a remoção de itens e a finalização de objetivos, garantindo a continuidade da narrativa e a experiência de jogo.

## Requesitos

**Funcionais:**

- O jogador pode se mover em 8 direções.
- O jogador e NPCs devem ter animações.
- O jogo deve ter NPCs.
- O jogador interage com NPC 's.
- O jogo deve registrar colisões entre objetos.
- O jogo deve permitir que itens sejam coletáveis.
- O jogo deve exibir mensagens ou ícones de interação quando o personagem entra em uma área de ação.
- O jogo deve ter diversos cenários.
- O jogo deve ter mobs para serem derrotados.

**Não funcionais:**

- Estilo visual: O jogo deve adotar uma estética pixel art.
- Padrão de controle: As teclas de movimentação devem seguir o padrão WASD ou as setas direcionais.
- Balanceamento: O jogo deve manter uma curva de dificuldade progressiva, evitando que o jogador enfrente inimigos impossíveis logo no início.
- Trilha sonora e efeito: O jogo deve possuir música ambiente e efeitos sonoros para ações principais (coletar item, atacar, interagir).

## Tecnologias

- **Linguagem:** O presente jogo foi desenvolvido utilizando a linguagem GDScript. Acesse [Godot Docs](https://docs.godotengine.org/pt-br/4.x/tutorials/scripting/gdscript/gdscript_basics.html) para mais informações.
- **Engine:** Como motor grafico utilizamos a engine open source e com baixa curva de aprendizado. Acesse [Godot](https://godotengine.org/) para mais informações.

## Equipe de Desenvolvimento

- Brendo Duarte
- Johan Queiroz
- Servolo Pedro

## Licença

Este projeto é licenciado sob a [Licença MIT](LICENSE).