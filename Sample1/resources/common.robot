*** Variables ***
${BROWSER}              chrome
${DELAY}                0
${HUB_URL}              http://192.168.86.129:4444/wd/hub
# Need to add static address in DHCP server to avoid the Selenium Grid container IP from changing.

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
    wait until page contains element    ${SELECTOR}     30