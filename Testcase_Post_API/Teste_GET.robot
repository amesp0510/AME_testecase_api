*** Settings ***


Library     RequestsLibrary
Library    Collections


*** Variables ***

${base_url}     http://dummy.restapiexample.com/

*** Test Cases ***

Get_all_employess
    create session      mysession       ${base_url}
    ${response}=         get request         mysession      api/v1/employees



    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

# Eu testei em varios sites de Teste de API e nao obtive sucesso https://apitester.com/  nuca retorna correto e
# nunca consigo gerar um usuario como deveria no banco de dados, nao sei se tem alguma coisa que eu deveria verificar
# mas nao tive sucesso.
