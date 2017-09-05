*** Settings ***
Test Teardown
Documentation    This suite tests my blog for basic functionality.
Library  Selenium2Library
Resource  ../resources/common.robot

*** Variables ***
${SERVER}               http://www.viney.ca
${USERNAME}             testuser1
${PASSWORD}             H6ZZsfwVT41M9Q8$6NcaMi4i

# css selectors
${landing_page_login_link_Selector}     css=#meta-2 > ul:nth-child(2) > li:nth-child(1) > a:nth-child(1)
${landing_page_verification_Selector}   css=#tsf > div.tsf-p > div.jsb > center > input[type="submit"]:nth-child(1)

*** Keywords ***
Open Browser to Landing Page
    [Arguments]  ${SERVER}  ${BROWSER}  ${SELECTOR}
    Start Browser   ${SERVER}   ${BROWSER}
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
    [Arguments]  ${verify_page_text}
    wait until page contains element  css=#wp-submit
    click element  id=wp-submit
    wait until page contains element  css=#wp-admin-bar-my-account > a > span
    wait until page contains  ${verify_page_text}

*** Test Cases ***
Login to Blog via Web
    [Tags]    Smoke
    Given Open Browser to Landing Page   ${SERVER}   ${BROWSER}  ${landing_page_login_link_Selector}
    When Click on Login Link
    And Input Username
    And Input Password
    Then Submit Login Form  Howdy, test user
    [Teardown]  close browser