*** Settings ***
Documentation    Speed test
Library  Selenium2Library
Resource  ../resources/common.robot

*** Variables ***
${SERVER}      http://www.fast.com

*** Test Cases ***
Check the speed of your broadband
    Open Browser to Landing Page    ${SERVER}   ${BROWSER}  id=speed-value
    Sleep     20
    click element     id=speed-progress-indicator-icon
    Sleep     20
    ${speed}=     Get Text  id=speed-value
    Close Browser