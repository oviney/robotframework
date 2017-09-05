*** Settings ***
Documentation    Speed test
Library  Selenium2Library
Resource  ../resources/common.robot

*** Variables ***
${SERVER}      http://www.fast.com

*** Keywords ***
Open Browser to Landing Page
    [Arguments]  ${SERVER}  ${BROWSER}  ${SELECTOR}
    Start Browser   ${SERVER}   ${BROWSER}
    set selenium speed  ${DELAY}
    wait until page contains element    ${SELECTOR}

*** Test Cases ***
Check the speed of your broadband
     Open Browser to Landing Page    ${SERVER}   ${BROWSER}  id=speed-value
     Sleep     20
     Capture Page Screenshot
     ${result}  get text  id=speed-value
     ${speed_units}  get text    id=speed-units
     Log    ${result} ${speed_units}
     Close Browser

