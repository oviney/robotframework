*** Settings ***

Metadata  Log of First Run   [first_run_log.html|first_run_log.html]
Metadata  Log of Second Run  [second_run_log.html|second_run_log.html]

*** Variables ***
${BROWSER}              chrome
${DELAY}                0
${HUB_URL}              http://192.168.86.88:4444/wd/hub


*** Keywords ***
Start Browser
    [Documentation]         Start firefox browser on Selenium Grid
    [Arguments]             ${SERVER}   ${BROWSER}
    Open Browser            ${SERVER}   ${BROWSER}   None  ${HUB_URL}

*** Keywords ***
Open Browser to Landing Page
    [Arguments]  ${SERVER}  ${BROWSER}  ${SELECTOR}
    Start Browser   ${SERVER}   ${BROWSER}
    set selenium speed  ${DELAY}
    wait until page contains element    ${SELECTOR}