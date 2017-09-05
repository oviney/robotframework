*** Settings ***
Test Teardown
Documentation    This suite tests my blog for basic functionality.
Library  Selenium2Library
Resource  ../resources/common.robot

*** Variables ***
# css selectors
${landing_page_verification_Selector}   css=#tsf > div.tsf-p > div.jsb > center > input[type="submit"]:nth-child(1)
${SERVER}               https://www.google.ca

*** Test Cases ***
Open Google
    [Tags]  Smoke
    Open Browser to Landing Page    ${SERVER}   ${BROWSER}  ${landing_page_verification_Selector}
    input text  id=lst-ib  robotframework
    press key  id=lst-ib    \\13
    ${result}   get text  id=resultStats
    log     ${result}
    [Teardown]  close browser