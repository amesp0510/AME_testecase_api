*** Settings ***

Documentation    Suite description
Library     RequestsLibrary
Library     Collections



*** Variables ***

${basic_url}      http://dummy.restapiexample.com/api/v1/




*** Test Cases ***
Post_create_employee
    create session      mysession       ${basic_url}
    ${body}=            create dictionary       name=Vinicius Miranda de Pinho      salary=1000        age=42
    ${header}=          create dictionary       Content-Type=application/json
    ${response}=        post request        mysession         /create      data=${body}        headers=${header}

    log to console     ${response.status_code}
    log to console     ${response.content}

    # Validacao das mensagens
    ${response_body}=       convert to string       ${response.content}
    #should contain          ${response_body}=       success
    ${status_code}          convert to string       ${response.status_code}
    #should be equal         ${status_code}          200





