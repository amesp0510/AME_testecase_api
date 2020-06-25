*** Settings ***

Documentation    Suite description
Library     RequestsLibrary
Library     Collections
Variables   ./Data_test/locators.py


*** Variables ***
${base_url}      http://dummy.restapiexample.com//api/v1
${name_post}    ${txt_nome_user}
${salary_post}   ${txt_salary}
${age_post}        ${txt_age}

*** Test Cases ***


put_customer_resgistration
    create session      mysession       ${base_url}
    ${body}=     create dictionary       name=${name_post}     salary=${salary_post}     age=${age_post}
    ${header}=       create dictionary   Content-Type=application/json      User-Agent=Firefox
    ${response}=     post request    mysession       /create        data=${body}        headers=${header}
    log to console      ${response.status_code}
    log to console      ${response.json()}

    # Validation
    ${res_body}=    convert to string   ${response.content}
    should contain      ${res_body}     success

    ${status_code}      convert to string   ${response.status_code}
    should be equal     ${status_code}      200
    should contain      ${res_body}        Vinicius Miranda de Pinho



