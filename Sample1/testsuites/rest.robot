*** Settings ***
Test Teardown
Documentation    This suite tests my blog for basic functionality.
Library  OperatingSystem
Library     BuiltIn
Library     Collections
Library     RequestsLibrary

*** Variables ***
${REST_API_URL}         http://jsonplaceholder.typicode.com

*** Keywords ***

*** Test Cases ***
REST Service Operation
    [Documentation]    Get the response from API
    Create Session    test    ${REST_API_URL}
    ${response}    Get Request    test    /posts/1
    Log    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200
    log    ${response.text}