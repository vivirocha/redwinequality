---
title: "Análise exploratória"
author: "Por Viviane Rocha"
output: html_document
---
<br> 
<br> 

<h4> <p style="color: black"> <b> ANÁLISE EXPLORATÓRIA DO BANCO DE DADOS: RED WINE QUALITY </b> </h4>

<table>
  <tr>
  <p> 
  <td>  
  <img align="left"> <img src='https://c.tenor.com/2ViG6x4AsmsAAAAC/magnifyingglass-lotoya-jackson.gif' width="185" height="116"/>  
  </td> 
  </p>
  <p> 
  <td> 
  <h6 align="justify"> <p> Conforme consta no site da [IBM](https://www.ibm.com/br-pt/cloud/learn/exploratory-data-analysis), a análise exploratória de dados (EDA) é usada por cientistas de dados para analisar e investigar <br>conjuntos de dados e resumir suas principais  características, muitas vezes usando métodos de visualização de dados. Ela permite <br>determinar a melhor forma  de controlar as fontes de dados para obter as respostas que você precisa, tornando mais fácil para os <br>cientistas de dados descobrir padrões, detectar  anomalias, testar uma hipótese ou verificar suposições. 
  <br>  
  <p> O objetivo principal da EDA é ajudar a analisar dados antes de fazer qualquer suposição.Ela pode ajudar na identificação de erros <br> óbvios e entender melhor os padrões presentes dos dados, detectar desvios  ou eventos anômalos, além de encontrar relações <br> interessantes entre as variáveis. 
  </p> 
  </div>
  </td> 
  </tr>
</table>

<h6> Para realizarmos nossas análise, utilizaremos o banco de dados sobre qualidade de vinho, 
disponível no site [UCI Machine Learning Repository]( https://archive.ics.uci.edu/ml/datasets/wine+quality).
<br>
<h6> <b> Contexto </b> 
<br>
<br>
Os dois conjuntos de dados estão relacionados com variantes tinto e branco do vinho português. 
Para mais detalhes, consulte a referência [Cortez et al., 2009]. Por questões de privacidade e 
logística, apenas variáveis físico-químicas (entradas) e sensoriais (saídas) estão disponíveis 
(por exemplo, não há dados sobre tipos de uva, marca de vinho, preço de venda do vinho, etc.).
Esses conjuntos de dados podem ser vistos como tarefas de classificação ou regressão. 
As classes são ordenadas e não equilibradas (por exemplo, há muito mais vinhos normais do que 
excelentes ou pobres).

<b> As variáveis contidas nesse dataset são:</b> 
<br>
<br>
Variáveis de entrada (com base em testes físico-químicos: <br>
<i> 1 - acidez fixa<br>
2 - acidez volátil<br>
3 - ácido cítrico<br>
4 - açúcar residual<br>
5 - cloretos<br>
6 - dióxido de enxofre livre<br>
7 - dióxido de enxofre total<br>
8 - densidade<br>
9 - pH<br>
10 - sulfatos<br>
11 - álcool</i><br>

Variável de saída (com base em dados sensoriais):<br>
<i>12 - qualidade (pontuação entre 0 e 10) </i> <br>
<br>
<b>Passo a passo:</b><br>
Após fazer o download do arquivo, salve ele dentro da pasta do seu projeto. 
Faça o carregamento do arquivo usando <i>read.csv</i> (perceba que a extensão do arquivo baixo é .csv)
Nomearemos o nosso dataset para <b>redwine</b> e então faremos o carregamento do arquivo.

```{r}
redwine <- read.csv('winequality-red.csv')
```

<b>Conhecendo nosso dataset</b><br
Usamos a função <b>dim</b> para mostrar a dimensão do nosso dataset:

```{r}
dim(redwine)
```
<i>Neste caso percebemos que nosso dataset tem 1599 observações (linhas) e 12 variáveis (colunas)</i> <br>
<br>
Inicialmente podemos usar a função <b>str</b> para observarmos quais são os tipos de dados que constam em cada variável:

```{r}
str(redwine)
```
<i>Conforme função utilizada acima, 11 das 12 variáveis são consideradas variáveis numéricas, apenas a variável 12  que faz referência a qualidade é considerada uma variável de tipo inteiro.</i><br>
<br>
Utilizaremos a função <b>head</b> para lermos os primeiros dados do nosso dataset e a função <b>tail</b> para lermos os últimos dados:

```{r}
head(redwine)
```

```{r}
tail(redwine)
```

Também podemos ver o nosso dataset utizando a função <b>View</b>, note que a letra V é <u>maiúscula</u>.

```{r}
View(redwine)
```

Verificaremos se há valores nulos no nosso dataset.

```{r}
is.null(redwine)
```


A informação foi falsa, portanto não há valores nulos no nosso banco de dados. 

Caso existisse valores nulos, poderíamos contabilizá-los da seguinte forma:

```{r}
sum(is.null(redwine))
```

Para verificarmos a existência de valores NA (not availaible), usamos is.na
Caso existisse valores NA, poderíamos contabilizá-los da seguinte forma:

```{r}
is.na(redwine)
sum(is.na(redwine))
```

# MEDIDAS DE CENTRALIDADE (média/mediana)
Média - Qual é a média da variável alcohol?

```{r}
mean(redwine$alcohol)
```


Mediana - Qual é a mediana da variável residual.sugar?

```{r}
median(redwine$residual.sugar)
```

Moda - Precisaremos montar a função que nos dará o resultado da moda, pois não há um padrão pré-definido no R base.
Qual é a moda da variável pH?

Primeiro vamos encontrar a frequência: 

```{r}
frequencia <- table(redwine$pH)
frequencia
```

Como poemos observar, não fica nada fácil visualizar o resultado com rapidez.

Segundo vamos encontrar qual é o valor que mais se repete:

```{r}
frequencia[frequencia == max(frequencia)]
```

Isso nos mostra que o valor 3.3 é o valor que mais aparece (57 vezes).

Terceiro: criando nossa função para Moda

```{r}
moda <- function(x) {
  tab = table(x)
  tab[tab == max(tab)]
}
```

Quarto: função criada, vamos rodar a nossa variável nela:

```{r}
moda(redwine$pH)
```

Bem mais simples depois que criamos a função!

# MEDIDAS DE DISPERSÃO(Desvio Padrão, Variância, Coeficiente de Variação, Amplitude e Quartis)

Desvio padrão da variável density:

```{r}
sd(redwine$density, na.rm = TRUE)
```

Variância da variável density:

```{r}
var(redwine$density, na.rm = TRUE)
```

Coeficiente de variação da variável density:
```{r}
sd(redwine$density, na.rm = TRUE)/mean(redwine$density, na.rm = TRUE)
```

Valor mínimo da variável density:

```{r}
min(redwine$density, na.rm = TRUE)
```


Valor máximo da variável density

```{r}
max(redwine$density, na.rm = TRUE)
```

Apresentando os valores mínimos e máximos apenas com uma função (variável density):

```{r}
range(redwine$density, na.rm = TRUE)
```

Amplitude da varivável density:

```{r}
diff(range(redwine$density, na.rm = TRUE))
```

Quartis da variável alcohol:

```{r}
quantile(redwine$alcohol)
```


Podemos utilizar a função summary para resumir os dados da variável alcohol:

```{r}
summary(redwine$alcohol)
```

Ou podemos mostrar os mesmos valores para o dataset inteiro:

```{r}
summary(redwine)
```

Quais são os valores únicos desta variável?

```{r}
unique(redwine$quality)
```

Podemos plotar um gráfico da nossa variável alcohol:

```{r}
hist(redwine$alcohol, freq = TRUE, labels = TRUE)
```

A mesma variável, porém sem os dados de frequência:

```{r}
hist(redwine$alcohol, freq = FALSE, labels = TRUE)
```

Para encontrarmos outliers, podemos plotar um boxplot

```{r}
boxplot(redwine$quality)
```

