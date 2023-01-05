# APP FLUTTER CONTROLE E GESTÃO DE CHAMADOS
O **Stop Control** foi pensado para:
* Substituir folhas de papel; 
* Maximizar tempo de serviço; 
* Gerar histórico de informações. 


## Contextualização

Desenvolvido como um projeto semestral do curso de Engenharia de Computação. Onde um dos critérios seria solucionar um caso real com uma aplicação.

O objetivo deste projeto é desenvolver um aplicativo para dispositivos móveis capaz de armazenar todas as informações necessárias para a equipe de manutenção referente às paradas e problemas dos equipamentos e maquinários

Em contexto de desperdício da capacidade produtiva dos colaboradores, pouca assertividade nos dados registrados, além dos danos ambientais advindos do desperdício de folhas, o cliente **"Centro de Distribuição Riachuelo – Guarulhos"** foi o selecionado para esse projeto de pesquisa devido a janela de oportunidades observada para implantação de um software capaz de registrar as informações de paradas dos equipamentos.

Sua **função** é transportar informações do **tempo de parada** de máquinas e equipamentos para **planilhas eletrônicas**, possibilitando a análise dessas informações e a criação de gráficos para saber quais as maiores oportunidades de melhoria dentre todo o maquinário

## Na prática
Ao abrir o app, o usuário terá que conectar em sua conta anteriormente cadastrada por um administrador:

![image](https://user-images.githubusercontent.com/98674448/210845178-df6ac04e-f3cf-413f-8727-8a290ec90d7e.png)

Ao se conectar, já cairá na tela de cadastro dos chamados para o preenchimento:

![image](https://user-images.githubusercontent.com/98674448/210845544-71ff9cfa-386a-4095-a556-d0d5854ec020.png)

Arrastando da esquerda para a direita, ou clicando nos três traços, no canto superior esquerdo será aberto um Drawer. A partir desta funcionalidade, será possível navegar entre as telas de 'Reportar Chamados' e a tela de 'Chamados Lançados':

![image](https://user-images.githubusercontent.com/98674448/210845928-6bf5685c-d386-4109-92df-89eb88c59fc5.png)

Neste Drawer de navegação, encontramos na parte superior, dados referente ao cadastro do usuário. 

Clicando no ListTile ‘Consultar Chamados’, é direcionado para a seguinte tela:

![image](https://user-images.githubusercontent.com/98674448/210846488-60354902-b629-409f-9810-ab871cb8009a.png)

Lá conseguimos visualizar todos os chamados abertos anteriormente. 

É possível arrastar cada chamado para a esquerda, para encontrarmos a opção de exclusão:

![app](https://user-images.githubusercontent.com/98674448/210849209-8f9ee328-bbd6-448b-8188-4f3eec8d548e.gif)

Ao deletar um chamado, aparecerá no canto inferior uma SnackBar, informando que o chamado foi removido com sucesso, também possui um botão 'Desfazer', que ao ser clicado, desfaz a ação feita pelo usuário, colocando o Card do chamado novamente na listagem.

O segundo botão, ‘Gerar Planilha’, ao clicar, será gerado um documento .xlsx, uma planilha com os dados dos chamados lançados:

![app](https://user-images.githubusercontent.com/98674448/210849911-9a3d661c-2f1a-4937-8c78-31a51c7a6e8d.gif)

# Resultados e conclusão

**Este projeto não se encontra em sua versão final**, trata-se apenas da parte visual (front-end) finalizada, ainda passível de atualizações e melhorias futuras. 

Para deixá-lo em um nível utilizável profissionalmente, falta os seguintes pontos:
- [ ] Implementar sistema de login a um banco de dados;
- [ ] Usuários poderem ver todos os chamados lançados por outros usuários que estiverem em sua mesma base (banco);
- [ ] Nova tela para gestão da manutenção dos chamados, a onde seria passado o status da situação referente ao andamento da correção.

A empresa Riachuelo se demonstrou interessada no aplicativo em questão devido seus savings e sua simplicidade de uso, contudo, levantou a questão da necessidade de alguns aprofundamentos antes da sua implantação real na companhia, como por exemplo a comunicação com um banco de dados real e um software de desktop para a visualização dos chamados abertos também em um pc, rodando full time, como também os pontos levantados anteriormente.

# Vídeo apresentação do projeto
https://youtu.be/Jifg4OZhcHg
