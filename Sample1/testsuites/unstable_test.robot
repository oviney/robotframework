*** Settings ***
Library  String
Resource  ../resources/common.robot

*** Test Cases ***
stable_test
    should be true  ${True}

unstable_test
    ${bool} =  random_boolean
    should be true  ${bool}

*** Keywords ***
random_boolean
    ${nb_string} =  generate random string  1  [NUMBERS]
    ${nb_int} =  convert to integer  ${nb_string}
    Run keyword and return  evaluate  (${nb_int} % 2) == 0