#Lista 1 - Correção de Sintaxe JSON

# Exercício 1
/*Analise a sintaxe (escrita) das variáveis 
que possuem como valor dados no formato JSON e corrija
os erros de sintaxe. Reescreva os códigos ou adicione a linha correta
utilizando um comentário, como no exemplo na alternativa a)*/

-- a)
 
aluno = {
		"nome""Maria", #Falta : entre a chave e valor
		"idade": 30, 
        "data_nascimento": 1995-02-02,  #Data está fora das aspas
			"endereco:	--	#Falta fechar aspas e falta abrir {
				"rua":"Rua dos Fundos",
				"numero":123	#Falta vírgula depois do 123
				"bairro"; "Centro",	#Falta substituir ponto e vírgula por dois pontos
				"cep":77830000		#Falta fechar a chave } do endereço
			}
			"contato":{		 #Falta vírgula antes de contato
				"telefone":"99999999",
				"email":"maria@dominio.com"
			}
		-- Falta a chave } para fechar o aluno.

-- b)

cidade =	-#Falta { para abrir 
		"nome":"Londrina", 
		"idade": 90, 
        "data_fundacao": 1934-12-10, #Data fora das aspas
		"":581000,
		"estado": "Paraná",
        "territorio":{
			"area":1652569,
			"relevo": "Predominantemente Plano",
            "altitude_maxima":840	-#Falta vírgula depois do valor 840
            "altitude_minima":570,
			
		}

-- c)

funcionario = {
    "Cpf": "33344555587",
    "Sexo": "M",
    "Salario": 40000.0  #Falta vírgula depois do valor
    "Endereco": Rua da Lapa 34 São Paulo SP  
    "Nome_Meio": "T",
    "Dependentes": [
        {
            "Sexo": "F",
            "Parentesco": "Filha",
            "Data_Nascimento": "1986-01-05T00:04:00",
            "Nome_Dependente": "Alicia"  
        }	 #Falta vírgula
        {
            "Sexo": "F",
            "Parentesco": "Esposa",
            "Data_Nascimento": "1958-01-03T00:05:00",
            "Nome_Dependente": "Janaína"
        },
        {
            "Sexo": "M",
            "Parentesco": "Filho",
            "Data_Nascimento" "1983-01-25T00:10:00",
            "Nome_Dependente": "Tiago"
        },
    "Ultimo_Nome": "Wong",  #Falta [ para fechar o Dependentes
    "Primeiro_Nome": "Fernando",
    "Cpf_Supervisor: "88866555576", #Falta fechar aspas no Supervisor
    "Data_Nascimento": "1955-01-12T00:08:00",
    "Numero_Departamento": "5"
}
}	#uma chave a mais

# Exercício 2

/*Analise as consultas SQL abaixo e aponte os erros de sintaxe. Tanto 
as estruturas JSON quanto os comandos SQL podem estar erradas.*/

-- a)

SELECT 
	JSON_EXTRACT("$.Primeiro_Nome", #Falta um doc JSon antes do $.Primeiro_Nome
    "$.Data_Nascimento", "$.Salario")
WHERE tb_object_funcionario;  #Substituir o Where por From

-- b)

SELECT 
	JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Primeiro_Nome"))  #Falta vírgula
    JSON_UNQUOTE(JSON_EXTRACT(JSON,"$.Data_Nascimento"),  #Falta ) para fechar
    JSON_EXTRACT(JSON,"$.Salario")
FROM empresa;

-- c)

SELECT T1.PARENTESCO, T1.SEXO FROM tb_object_funcionario  #T1 não foi definido
CROSS JOIN
JSON_TABLE (
	JSON_EXTRACT(JSON, "$.Dependentes"), "$[*]"
    COLUMNS (PARENTESCO VARCHAR(50) "$.Parentesco", #Falta path
			SEXO VARCHAR(50) PATH "$.Sexo")
) AS T2;  #Ou alterar para T1

-- d)

SELECT JSON_KEYS(doc, "geography") FROM countryinfo  #Falta a raiz $. antes de geography
WHERE _id = 'BRA';

-- e)

SELECT JSON_EXTRACT(doc, "$.GNP") as GNP  #Falta o doc Json
  , JSON_EXTRACT(doc, "$.Code") as Code
  , JSON_EXTRACT(doc, "$.Name") as Name
  , JSON_EXTRACT(doc, "$.IndepYear") as IndepYear
  , JSON_EXTRACT(doc, "$.geography.Region") as Region
  , JSON_EXTRACT(doc, "$.geography.Continent") as Continent
  , JSON_EXTRACT(doc, "$.geography[0]") as SurfaceArea
  , JSON_EXTRACT(doc, "$.government.HeadOfState") as HeadOfState
  , JSON_EXTRACT(doc, "$.government.GovernmentForm") as GovernmentForm
  , JSON_EXTRACT(doc, "$.demographics") as Population  #Falta vírgula depois de Population
    JSON_EXTRACT(doc, "$.demographics.LifeExpectancy") as LifeExpectancy  
  FROM countryinfo;
  
-- f)

SELECT JSON_EXTRACT("$.geography.Continent") as Continent,
(JSON_EXTRACT(doc, "$.demographics.Population")) as Population,
AVG(JSON_EXTRACT(doc, "$.demographics.LifeExpectancy")) as LifeExpectancy 
WHERE JSON_EXTRACT(doc, "$.government.") LIKE('%Monarchy%'),  #Retirar vírgula depois do like e antes do from
FROM countryinfo  #From precisa ser antes de Where
GROUP BY JSON_EXTRACT(doc, "$.geography")  
ORDER BY 2;