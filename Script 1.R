"
ANÁLISE DO BANCO DE DADOS: RED WINE QUALITY

Para realizarmos nossas análise, utilizaremos o banco de dados sobre qualidade de vinho, 
disponível no site UCI Machine Learning Repository: https://archive.ics.uci.edu/ml/datasets/wine+quality

Contexto
Os dois conjuntos de dados estão relacionados com variantes tinto e branco do vinho português. 
Para mais detalhes, consulte a referência [Cortez et al., 2009]. Por questões de privacidade e 
logística, apenas variáveis físico-químicas (entradas) e sensoriais (saídas) estão disponíveis 
(por exemplo, não há dados sobre tipos de uva, marca de vinho, preço de venda do vinho, etc.).
Esses conjuntos de dados podem ser vistos como tarefas de classificação ou regressão. 
As classes são ordenadas e não equilibradas (por exemplo, há muito mais vinhos normais do que 
excelentes ou pobres).

As variáveis contidas nesse dataset são:

Variáveis de entrada (com base em testes físico-químicos):

1 - acidez fixa
2 - acidez volátil
3 - ácido cítrico
4 - açúcar residual
5 - cloretos
6 - dióxido de enxofre livre
7 - dióxido de enxofre total
8 - densidade
9 - pH
10 - sulfatos
11 - álcool

Variável de saída (com base em dados sensoriais):
12 - qualidade (pontuação entre 0 e 10)
"

#Após fazer o download do arquivo, salve ele dentro da pasta do seu projeto. 
#Faça o carregamento do arquivo usando read.csv (perceba que a extensão do arquivo baixo é .csv)

#Nomearemos o nosso dataset para redwine e então faremos o carregamento do arquivo.

redwine <- read.csv('winequality-red.csv')

"CONHECENDO NOSSO DATASET"

#Usamos a função dim para mostrar a dimensão do nosso dataset
dim(redwine)
#Neste caso percebemos que nosso dataset tem 1599 observações (linhas) e 12 variáveis (colunas)

#Inicialmente podemos usar a função str para observarmos quais são os tipos de dados que constam em cada variável
str(redwine)
#Conforme função utilizada acima, 11 das 12 variáveis são consideradas variáveis numéricas, apenas a variável 12  que faz referência a qualidade é considerada uma variável de tipo inteiro.

#Utilizaremos a função head para lermos os primeiros dados do nosso dataset e a função tail para lermos os últimos dados:
head(redwine)

tail(redwine)

#Também podemos ver o nosso dataset utizando a função View, note que a letra V é maiúscula
View(redwine)

#Verificaremos se há valores nulos no nosso dataset
is.null(redwine)
#A informação foi falsa, portanto não há valores nulos no nosso banco de dados. 

#Caso existisse valores nulos, poderíamos contabilizá-los da seguinte forma:
sum(is.null(redwine))

#Para verificarmos a existência de valores NA (not availaible), usamos is.na
#Caso existisse valores NA, poderíamos contabilizá-los da seguinte forma:
is.na(redwine)
sum(is.na(redwine))

"MEDIDAS DE CENTRALIDADE (média/mediana)" 

#Média - Qual é a média da variável alcohol?
mean(redwine$alcohol)

#Mediana - Qual é a mediana da variável residual.sugar?
median(redwine$residual.sugar)

#Moda - Precisaremos montar a função que nos dará o resultado da moda, pois não há um padrão pré-
#definido no R base.
# Qual é a moda da variável pH?

#Primeiro vamos encontrar a frequência: 
frequencia <- table(redwine$pH)
frequencia
#Como poemos observar, não fica nada fácil visualizar o resultado com rapidez.

#Segundo vamos encontrar qual é o valor que mais se repete:
frequencia[frequencia == max(frequencia)]
#Isso nos mostra que o valor 3.3 é o valor que mais aparece (57 vezes)

#Terceiro: criando nossa função para Moda
moda <- function(x) {
  tab = table(x)
  tab[tab == max(tab)]
}

#Quarto: função criada, vamos rodar a nossa variável nela:
moda(redwine$pH)
#Bem mais simples depois que criamos a função!

"MEDIDAS DE DISPERSÃO(Desvio Padrão, Variância, 
Coeficiente de Variação, Amplitude e Quartis)"

#Desvio padrão da variável density
sd(redwine$density, na.rm = TRUE)

#Variância da variável density
var(redwine$density, na.rm = TRUE)

#Coeficiente de variação da variável density
sd(redwine$density, na.rm = TRUE)/mean(redwine$density, na.rm = TRUE)

#Valor mínimo da variável density
min(redwine$density, na.rm = TRUE)

#Valor máximo da variável density
max(redwine$density, na.rm = TRUE)

#Apresentando os valores mínimos e máximos apenas com uma função (variável density)
range(redwine$density, na.rm = TRUE)

#Amplitude da varivável density
diff(range(redwine$density, na.rm = TRUE))

#Quartis da variável alcohol
quantile(redwine$alcohol)

#Podemos utilizar a função summary para resumir os dados da variável alcohol.
summary(redwine$alcohol)

#Ou podemos mostrar os mesmos valores para o dataset inteiro
summary(redwine)

#Quais são os valores únicos desta variável?
unique(redwine$quality)

#Podemos plotar um gráfico da nossa variável alcohol:
hist(redwine$alcohol, freq = TRUE, labels = TRUE)

#A mesma variável, porém sem os dados de frequência:
hist(redwine$alcohol, freq = FALSE, labels = TRUE)

#Para encontrarmos outliers, podemos plotar um boxplot
boxplot(redwine$quality)

