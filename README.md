# Aprendendo SQL com MySQL

Este repositório é destinado para eu escrever anotações sobre o mysql, abordar tópicos e conceitos vistos no
livro [SQL: Learn SQL (using MySQL) in One Day and Learn It Well. SQL for Beginners with Hands-on Project.](https://www.amazon.com/SQL-Beginners-Hands-Project-Project/dp/1731039662?_encoding=UTF8&qid=1628268685&sr=1-9&linkCode=sl1&tag=solutionsre04-20&linkId=6dfcf2bfc4e95af8907fd157b8e78e2c&language=en_US&ref_=as_li_ss_tl)

**Observação**: Não abordarei sobre processo de instalação do MySQL e ferramentas necessárias.

## Capítulo I

### Conceitos

- SQL(Structured Query Language) significa Linguagem de Busca Estruturada que usada para gerenciar dados em um base de
  dados relacional.
- Database/Base de dados é uma coleção de dados organizados que podem ser facilmente acessados. Há base de dados
  relacional e não relacional. Focaremos em base de dados relacional, cujos dados são armazenados em formato de
  tabelas.
- DBMS(Database Management Software) / SGBD Software gerenciador de Base de dados. É um software que é usado para
  gerenciar nossa base de dados.

### Primeiro código SQL

```sql
SELECT 'Hello MySQL';
```

O `SELECT` é um comando de projeção(selecionar e exibir, colunas necessárias), utilizado para recuperar dados nas bases.

### Comentários

Há três maneiras:

```mysql
-- Comentário de uma linha(mais usual)

#Comentário de uma linha

/*
Comentário 
de 
múltiplas 
linhas
 */
```

## Capítulo II

### Criando uma base de dados

Para este estudo, criaremos uma base de dados chamada `companyHR`(base de dados criada no livro).

```mysql
CREATE DATABASE companyHR;
``` 

O comando `CREATE DATABASE` é usado para criar uma base de dados. São palavras reservados do MySQL. O nome da base de
dados deve ser único.

Para acessar e criar as tabelas, é necessário selecionar/usar a base de dados.

```mysql
USE companyHR;
```

Após a execução do comando `USE`, a base de dados `companyHR` será selecionada e usada. e com isso poderemos criar as
tabelas, e realizar buscas nas mesmas.

### Apagando a base de dados

```mysql
DROP DATABASE companyHR;
```

Com o comando acima, conseguimos deletar uma base de dados. Comando que deve ser usado com **MUITO CUIDADO**.

## Capítulo III

### Conceitos

- Tabelas são estruturas de dados que armazenam dados em linhas e colunas. Cada linha é chamada de registro ou tupla, e
  cada coluna é chamada de campo. Cada registro deve ter um valor para cada campo, mas nem todos os campos precisam ter
  valores.
- Colunas são campos que armazenam dados de um tipo de dados específico.

### Criando uma tabela

```
CREATE TABLE table_name
(
    column_name1 datatype [column constraints],
    column_name2 datatype [column constraints],
    [table constraints], 
    [table constraints]
);
```

Acima temos um código que mostra a estrutura do que é necessário para criar uma tabela.
`CREATE TABLE` são palavras reservada para a criação de tabelas. `table_name` é o nome da tabela que será criada.
E dentro dos parênteses é necessário passar o nome das colunas, seus tipos e as restrições.

#### Tipos de dados mais comuns

**Tipos de dados textuais**

- `CHAR(SIZE)` - armazena um tamanho fixo de caracteres. O tamanho máximo é 255 caracteres. Dentro dos parênteses é
  necessário passar o total de caracteres que a coluna irá armazenar. Caso a cadeia de caracteres a ser armazenada seja
  menor que o tamanho definido, o MySQL irá preencher com espaços em branco. Caso seja maior, o MySQL irá apresentar
  um erro.
- `VARCHAR(SIZE)` - armazena uma cadeia de caracteres de tamanho variável. O tamanho máximo é 255 caracteres. Esse tipo
  de dados é mais flexível que o char. Caso eu defina `VARCHAR(5)` e armazenar a palavra `RUI`, diferente do `char` o
  MySQL não irá preencher com espaços vazios. Portanto, o `VARCHAR` é mais lento que o `CHAR`.
  Usaremos o `CHAR` em casos que sabemos que a string será fixa

**Tipos de dados numéricos**

- `INT` é usado para números inteiros(sem casas decimais) armazena números com sinal de -2147483648 a 2147483647, 
  ou seja, suporta até 10 dígitos no total.
- `FLOAT(m, d)` é usado para números de ponto flutuante, ou seja, números com casas decimais. Usa 4 bytes para armazenar.
    Onde `m` é o número máximo de dígitos e `d` é o número máximo de casas decimais.
  Por exemplo, `FLOAT(5,2)` pode armazenar números de -999.99 a 999.99.
  Se o número a ser inserido for maior que a quantidade de dígitos definida, o MySQL irá arredondar o número.
- `DOUBLE(m, d)` é usado para números de ponto flutuante, ou seja, números com casas decimais. Usa 8 bytes para armazenar.
    Onde `m` é o número máximo de dígitos e `d` é o número máximo de casas decimais.
  Por exemplo, `DOUBLE(5,2)` pode armazenar números de -999.99 a 999.99.
  Se o número a ser inserido for maior que a quantidade de dígitos definida, o MySQL irá arredondar o número.
- `DECIMAL(m, d)` é usado para números de ponto flutuante, porém a diferença entre os dois anteriores, é que aqui o 
  número é armazenado de forma exata! já no `DOUBLE` e `FLOAT` o número é armazenado de forma aproximada.
  É usado para armazenar valores monetários, pois é necessário que o valor seja exato.

**Tipos de dados de data e hora**

- `YEAR` é usado para armazenar um ano de 4 dígitos. O ano deve ser especificado como um número de 4 dígitos no formato
  YYYY. Por exemplo, 2021. São permitidos valores de 1901 a 2155. É possível armazenar ano com 2 dígitos, porém é 
  premitido 1 até 69 representando 2001 até 2069 e 70 até 99 representando 1970 até 1999.
- `DATE` é usado para armazenar uma data no formato YYYY-MM-DD. Onde YYYY é o ano, MM é o mês e DD é o dia.
  suporta datas no intervalo de 1000-01-01 a 9999-12-31.
- `TIME` é usado para armazenar um horário no formato HH:MM:SS. Onde HH é a hora, MM é o minuto e SS é o segundo.
  suporta horários no intervalo de -838:59:59 a 838:59:59.
- `DATETIME` é usado para armazenar uma data e hora no formato YYYY-MM-DD HH:MM:SS. Onde YYYY é o ano, MM é o mês, DD é o
  dia, HH é a hora, MM é o minuto e SS é o segundo.
  suporta datas no intervalo de 1000-01-01 00:00:00 a 9999-12-31 23:59:59.
- `TIMESTAMP` é usado para armazenar uma data e hora no formato YYYY-MM-DD HH:MM:SS. Onde YYYY é o ano, MM é o mês, DD é o
  dia, HH é a hora, MM é o minuto e SS é o segundo.
  suporta datas no intervalo de 1970-01-01 00:00:01 UTC a 2038-01-19 03:14:07 UTC.
  Uma das principais diferenças entre o `TIMESTAMP` e o `DATETIME` é que o `TIMESTAMP` é que o MySQL converte o valor 
  do `TIMESTAMP` do fuso horário atual para UTC para armazenamento e converte de volta para o fuso horário atual.
  Pois os dados armazenados são usados como base o servidor / base de dados.

#### Restrincões de colunas

- `NOT NULL` é usado para especificar que a coluna não pode armazenar valores nulos.
- `DEFAULT` é usado para especificar um valor padrão para a coluna quando nenhum valor é especificado.
- `AUTO_INCREMENT` é usado para gerar automaticamente um número único para cada linha. Para cada valor inserido na base 
  de dados ou uma tentativa de tentar inserir, o MySQL irá incrementar o valor da coluna em 1. Por padrão começa em 1. 
  Porém, podemos modificar o valor inicial e o incremento.
- `UNIQUE` é usado para garantir que todos os valores numa coluna sejam diferentes.
- `PRIMARY KEY` é usado para identificar exclusivamente cada linha numa tabela. O valor da chave primária não pode ser
  duplicado e não pode ser nulo.


### Criando a primeira tabela
```mysql
CREATE TABLE co_employees(
  id      INT AUTO_INCREMENT PRIMARY KEY,
  em_NAME VARCHAR(255) NOT NULL,
  gender  CHAR(1) NOT NULL,
  contact_number VARCHAR(255),
  date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL 
);
```

A tabela contém as colunas com os nomes: `id`, `em_NAME`, `gender`, `contact_number` e `date_created`.
E tem as suas restrições. A coluna `id` é a chave primária, pois é a coluna que identifica exclusivamente cada linha.
A coluna `em_NAME` não pode ser nula, pois é necessário que o nome do funcionário seja informado.
A coluna `gender` não pode ser nula, pois é necessário que o gênero do funcionário seja informado.
A coluna `contact_number` pode ser nula, pois não é necessário que o número de contato seja informado.
A coluna `date_created` tem um valor padrão, que é a data e hora atual, e não pode ser nula.

