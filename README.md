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




