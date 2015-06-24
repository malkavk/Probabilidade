(en)
# Law of Large Numbers (LLN) and Central Limit Theorem (CLT)

This Markdown/Shiny presentation shows the Law of Large Numbers (LLN) and Central Limit Theorem (CLT), providing a interactive way to show these important theoretical bases for probability.

"aula-LGN-TCL.Rmd" is a RStudio generated file, having Markdown/Shiny and R code.

### Execution

1. Open "aula-LGN-TCL.Rmd" file on RStudio
2. Press "Run Presentation" button
3. In new appearing window, press "Open in Browser" button
4. Use keyboard arrows to navigate and mouse to act on appearing controls and click on links

### The Presentation

The page 3 shows the LLN definition and 6, CLT definition, with external links to animations that illustrate then.

The page 4 is composed for:

1. A slider control labeled "Quantidade de Amostras (10^n):"

  This control sets the number of observations to be used on chart (from 10^1 to 10^8 observations). 

2. A slider control labeled "Média Definida:"

  This control sets the user defined mean to be used on a selected function. On Uniform case, samples are generated between 0 and 2*\<this slider value\>.

3. A radio button group labeled "Selecione:"

  Theses radio buttons sets the distribution to be used to build the chart. 
  
  - For Binomial distribution the size parameter was set to 1. 
  - For Exponetial distribution the rate parameter is set to 1/\<value of "Média Definida:"\>. 
  - For Poisson distribution the lambda parameter is set to \<value of "Média Definida:"\>. 
  - For Cauchy distribution the location and scale parameters were set to default values (0 and 1).

4. The chart

  In this chart is drawn a red line for the value set on "Média Definida:" slider, a green line for sample mean and dots representing each Sn/n .

The page 7 is composed for:

1. A slider control labeled "Quantidade de Amostras (10^n):"

  This slider sets the number of observations to be used on chart (from 10^1 to 10^8 observations).
  
2. A slider control labeld "Quantidade de v.a.:"

  This slider sets the number o random variables to calculate Sn.

3. A radio button group labeled "Selecione:"

  Theses radio buttons sets the distribution to be used to build the chart. 
  
  - For Uniform distribution the parameters min and max was set to 0 and 1. 
  - For Binomial distribution the parametes prob and size was set to 0.5 and 1. 
  - For Beta distribution the parameters shape1 and shape2 was set to 3 and 1. 
  - For Exponetial distribution the parameter lambda was set to 1.
  
4. The chart

  This chart is a histogram of the probabilities calculated with the help of expression defined by CLT and line illustrating the density of the expression.

### Possible Errors

After pressing the "Run Presentation" button, sometimes the new RStudio window must be blank or present some graphical glitches, in these cases just ignore it and press the "Open in Browser" button.

After pressing the "Run Presentation" button, sometimes appears the interactive controles are shown, but not charts (appearing some red text), in these cases close the window and press again the "Run Presentaion" button.

Those errors occurs for unknown reasons and happens randonly.

--------------------------------------------------------------------------------------------------------------------
(pt-br)

# Lei dos Grandes Números (LGN) e Teorema Central do Limite(TCL)

Esta apresentação Markdown/Shiny apresenta a Lei dos Grandes Números (LGN) e o Teorema Central do Limite (TCL), proporcionando uma forma interativa de ilustrar estas importantes bases teóricas para probabilidade.

O arquivo "aula-LGN-TCL.Rmd" foi gerado no RStudio, tendo código Markdown/Shiny e R.

## Execução

1. Abra o arquivo "aula-LGN-TCL.Rmd" no RStudio
2. Pressione o botão "Run Presentation" 
3. Na nova janela que aparece, pressione o botão "Open in Browser"
4. Use as setas do teclado para navegar entre as páginas e o mouse para atuar nos controles que aparecem e clicar nos links

### A Apresentação

A página 3 mostra a definição da LGN e a 6, a dfinição da TCL; com links para animações que ilustram-as.

A página 4 é composta por:

1. Um controle deslizante identificado por "Quantidade de Amostras (10^n):"

  Este controle define o número de observações a serem usadas no gráfico (indo de 10^1 a 10^8 observações). 

2. Um controle deslizante identicado por "Média Definida:"

  Este controle define a média a ser usada na função escolhida. No caso da Uniforme, as amostras são geradas entre 0 e 2*\<o valor deste controle\>.

3. Um grupo de "radio button" identificados por "Selecione:"

  Estes botões definem qual a distribuição a ser usada para construir o gráfico. 
  
 - Para distribuição Binomial, o parâmetro size está definido para 1. 
 - Para distribuição Exponecial, o parâmetro rate está definido para 1/\<valor de "Média Definida:"\>.
 - Para distribuição de Poisson, o parâmetro lambda está definido para \<valor de "Média Definida:"\>. 
 - Para distribuição Cauchy, os parâmetros location e scale foram definidos com valores padrão (0 e 1).

4. O Gráfico

  Neste gráfico estão desenhados uma linha vermelha para o valor de "Média Definida:" slider, uma linha verde para média da amostra e pontos representando cada Sn/n.

A página 7 é composta de:

1. Um controle deslizante identificado por "Quantidade de Amostras (10^n):"

  Este controle define o número de observações a ser usadas na construção do gráfico (indo de 10^1 a 10^8 observações).
  
2. Um controle deslizante identificado por "Quantidade de v.a.:"

  ESte controle define número de variáveis aleatórias para caulcular Sn.

3. Um grupo de "radio button" identificado por "Selecione:"

  Este controle define que distribuição será usada para construir o gráfico.
  
  - Para distribuição Uniforme, os parâmetros min e max foram definidos para 0 e 1.
  - Para distribuição Binomial, os parâmetros prob e sizeforam definidos para 0.5 e 1.
  - Para distribuição Beta, os parâmetros shape1 e shape2 foram definidos para 3 e 1. 
  - Para distribuição Exponecial, o parâmetro lambda foi definido para 1.
  
4. O gráfico

  Este gráfico é um histograma das desnsidades de probabilidades calculadas com a ajuda da expressão definida pela TCL, além de uma linha ilustrando a densidade da expressão.

## Possíveis Erros

Depois de pressionar o botão "Run Presentation", algumas vezes a nova janela do RStudio pode estar em branco ou apresentando alguns probelams gráficos, nestes casos, apenas ignore e pressione o botão "Open in Browser".

Depois de pressionar o botão "Run Presentation", algumas vezes aparecem os controles interativos, mas não os gráficos (aparecendo algum texto em vermelho), nestes casos, feche a janela e pressione novamente o botão "Run Presentaion".

Esses erros ocorrem por motivo desconhecido e de forma aleatória.

