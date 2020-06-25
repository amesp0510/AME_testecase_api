*** Settings ***

Documentation    Suite description
Library     RequestsLibrary
Library     Collections



*** Variables ***
${base_url}    http://dummy.restapiexample.com//api/v1


*** Test Cases ***
put_customer_resgistration
    create session      mysession       ${base_url}
    ${body}=     create dictionary       FirstName=vini2   LastName=pinho2  UserName=testeuser2
    ${header}=       create dictionary   Content-Type=application/json
    ${response}=     post request    mysession       /create        data=${body}        headers=${header}
    log to console      ${response.status_code}
    log to console      ${response.json()}

    # Validation
    ${res_body}=    convert to string   ${response.content}
    should contain      ${res_body}     OPERATION_SUCCESS
    should contain      ${res_body}     Operation completed successfully

    ${status_code}      convert to string   ${response.status_code}
    should be equal     ${status_code}      201