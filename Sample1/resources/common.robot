*** Variables ***
${BROWSER}              chrome
${DELAY}                0
${HUB_URL}              http://192.168.86.83:4444/wd/hub

*** Keywords ***
Start Browser
    [Documentation]         Start firefox browser on Selenium Grid
    [Arguments]             ${SERVER}   ${BROWSER}
    Open Browser            ${SERVER}   ${BROWSER}   None  ${HUB_URL}