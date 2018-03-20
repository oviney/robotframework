*** Settings ***
Test Teardown
Documentation    This suite tests my blog for basic functionality.
Library  OperatingSystem
Library     SudsLibrary
Library     BuiltIn
Library     Collections
Library     RequestsLibrary
Metadata    Log of First Run        [first_run_log.html|first_run_log.html]
Metadata    Log of Second Run       [second_run_log.html|second_run_log.html]

*** Variables ***
${SOAP_WSDL_URL}        http://www.webservicex.net/Statistics.asmx?WSDL
${REST_API_URL}         http://jsonplaceholder.typicode.com

*** Keywords ***
Call Web Service with Operation
    Create Soap Client  ${SOAP_WSDL_URL}
#    Set Proxies     http    http://localhost:8888

    ${dbl array}=	Create Wsdl Object	ArrayOfDouble
    Append To List	${dbl array.double}	2.0
    Append To List	${dbl array.double}	3.0
    ${result}=	Call Soap Method	GetStatistics	${dbl array}
    Should Be Equal As Numbers	${result.Average}	2.5

*** Test Cases ***
SOAP Webservice Operation
    Call Web Service with Operation

REST Service Operation
    [Documentation]    Get the response from API
    Create Session    test    ${REST_API_URL}
    ${response}    Get Request    test    /posts/1
    Log    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200
    log    ${response.text}