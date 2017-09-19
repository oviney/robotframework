*** Settings ***
Documentation    Speed test
Library  Selenium2Library
Resource  ../resources/common.robot

*** Variables ***
${SERVER}      http://www.fast.com

*** Test Cases ***
Check the speed of your broadband
    # This causes the speed test to sart on page load.
    Open Browser to Landing Page    ${SERVER}   ${BROWSER}  id=speed-value

#    wait until element is visible   css=#speed-units
#    click element     id=speed-progress-indicator-icon
    # fake the script takes longer - simulate longer running test
#    sleep   20
    # not working - need to know how to detect the speed test is complete.
#    wait until element is visible   css=#speed-value
#    wait until element contains  css=#speed-progress-indicator
#    get webelement  css=#speed-progress-indicator
#    wait until page contains    "speed-progress-indicator circle     succeeded"
#    wait until element contains
    # //*[@id="speed-progress-indicator"]
    wait until page contains element     css=div.succeeded      30
    capture page screenshot
#    ${class}=       get element attribute   speed-progress-indicator@class
#    Log    ${class}
    wait until page contains element    css=#speed-progress-indicator-icon
    # click on the speed test again
    click element  css=#speed-progress-indicator-icon
    ${speed}=     Get Text  id=speed-value
    capture page screenshot
    Close Browser