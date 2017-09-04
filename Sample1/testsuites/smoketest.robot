*** Settings ***
Test Teardown
Documentation    This suite tests my blog for basic functionality.
Library  Selenium2Library
Library  OperatingSystem
#Suite Setup  Setup chromedriver
#Suite Teardown  Close Browser
Library     SudsLibrary
Library     BuiltIn
Library     Collections
Library     RequestsLibrary

*** Variables ***
${SERVER}               https://www.google.ca
${USERNAME}
${PASSWORD}
${BROWSER}              Chrome
${DELAY}                0
${EXECDIR}              /home/oviney/PycharmProjects/RobotFramework2/drivers/
${SOAP_WSDL_URL}        http://www.webservicex.net/Statistics.asmx?WSDL

# css selectors
${landing_page_login_link_Selector}     css=#meta-2 > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)

*** Keywords ***
Open Browser to Landing Page
    [Arguments]  ${SERVER}  ${BROWSER}  ${SELECTOR}
    open browser    ${SERVER}     ${BROWSER}
    # maximize browser window
    # maximize causes issues in headless browser scenario - see https://github.com/angular/protractor/issues/4407 and
    set selenium speed  ${DELAY}
    wait until page contains element    ${SELECTOR}

Click on Login Link
    click element  ${landing_page_login_link_Selector}
    wait until page contains element  css=#jetpack-sso-wrap > a.jetpack-sso-toggle.wpcom
    click element  css=#jetpack-sso-wrap > a.jetpack-sso-toggle.wpcom
    wait until page contains element  css=#user_login

Input Username
    wait until page contains element  css=#user_login
    input text  id=user_login   ${USERNAME}

Input Password
    wait until page contains element  css=#user_pass
    input text  id=user_pass   ${PASSWORD}

Submit Login Form
    wait until page contains element  css=#wp-submit
    click element  id=wp-submit
    wait until page contains element  css=#wp-admin-bar-my-account > a > span
    wait until page contains  Howdy, oviney
    [Teardown]  close browser

Call Web Service with Operation
    Create Soap Client  ${SOAP_WSDL_URL}
    ${dbl array}=	Create Wsdl Object	ArrayOfDouble
    Append To List	${dbl array.double}	2.0
    Append To List	${dbl array.double}	3.0
    ${result}=	Call Soap Method	GetStatistics	${dbl array}
    Should Be Equal As Numbers	${result.Average}	2.5

#Setup chromedriver
#    Set Environment Variable  webdriver.chrome.driver  /home/oviney/PycharmProjects/RobotFramework2/drivers/chromedriver
#    driver = webdriver.Chrome('/path/to/chromedriver')  # Optional argument, if not specified will search path.

*** Test Cases ***
#Login to Blog via Web
#    [Tags]    Smoke
#    Given Open Browser to Landing Page
#    When Click on Login Link
#    And Input Username
#    And Input Password
#    Then Submit Login Form

Open Google
    Open Browser to Landing Page    https://www.google.ca   Chrome  css=#tsf > div.tsf-p > div.jsb > center > input[type="submit"]:nth-child(1)

SOAP Webservice Operation
    Call Web Service with Operation

REST Service Operation
    [Documentation]    Get the response from API
    Create Session    test    http://jsonplaceholder.typicode.com
    ${response}    Get Request    test    /posts/1
    Log    ${response.status_code}
    Should Be Equal As Strings    ${response.status_code}    200
    log    ${response.text}