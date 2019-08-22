#language:pt

Funcionalidade: Qual é o prato do dia
    Queremos saber qual o prato do dia na capital paulista

    Cenário: Hoje é dia de Virado a Paulista

        Dado que hoje é segunda-feira
        Quando eu pergunto qual é o prato do dia
        Então a resposta deve ser "Virado a Paulista"

    Cenário: Hoje é dia de Dobradinha

        Dado que hoje é terça-feira
        Quando eu pergunto qual é o prato do dia
        Então a resposta deve ser "Dobradinha"
