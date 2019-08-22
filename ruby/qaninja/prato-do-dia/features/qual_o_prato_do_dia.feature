#language:pt

Funcionalidade: Qual é o prato do dia
    Queremos saber qual o prato do dia na capital paulista

    Cenário: Hoje é dia de Virado a Paulista

        Dado que hoje é "segunda-feira"
        Quando eu pergunto qual é o prato do dia
        Então a resposta deve ser "Virado a Paulista"

    Cenário: Hoje é dia de Dobradinha

        Dado que hoje é "terça-feira"
        Quando eu pergunto qual é o prato do dia
        Então a resposta deve ser "Dobradinha"

    Cenário: Hoje é dia de Feijoada

        Dado que hoje é "quarta-feira"
        Quando eu pergunto qual é o prato do dia
        Então a resposta deve ser "Feijoada"

    Esquema do Cenário: Prato do dia

        Dado que hoje é <dia>
        Quando eu pergunto qual é o prato do dia
        Então a resposta deve ser <resposta>

        Exemplos:
        |dia            |resposta           |
        |"segunda-feira"|"Virado a Paulista"|
        |"terça-feira"  |"Dobradinha"       |
        |"quarta-feira" |"Feijoada"         |
        |"quinta-feira" |"Macarronada"      |
        |"sexta-feira"  |"Filé de Merluza"  |
        |"sábado"       |"Veja o Cardápio"  |
        |"domingo"      |"Fechado"          |
        |"abcd"         |"Dia Inválido"     |
        |"xpto"         |"Dia Inválido"     |