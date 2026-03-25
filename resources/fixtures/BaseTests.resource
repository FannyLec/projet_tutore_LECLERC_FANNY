*** Settings ***
Documentation       Keywords pour le run configuration
Variables    ../config/env_vars.py
Library    SeleniumLibrary
Resource    ../config/Variables.resource


*** Keywords ***

Suite Setup
    [Documentation]    Suite Setup
    ${compte}    Create Dictionary
    ...    username=${USER_NAME}
    ...    password=${PASSWORD}
    Set Global Variable    ${COMPTE}    ${compte}
    Set Log Level    INFO

Test Setup
    [Documentation]    Test Setup
    Log To Console    ${EMPTY}
    Log To Console    ==================================================================
    Log To Console    DEMARRAGE DU TEST : ${TEST NAME}
    Log To Console    BROWSER=${BROWSER}
    Log To Console    ==================================================================
    Register Keyword To Run On Failure    NONE
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Selenium Implicit Wait    ${IMPLICIT_WAIT}
    Maximize Browser Window

Test Teardown
    [Documentation]    Test Teardown
    Log To Console    ==================================================================
    Log To Console    FIN DU TEST : ${TEST NAME}
    Log To Console    ==================================================================
    Close Browser

Suite Teardown
    [Documentation]    Suite Teardown
    Log To Console    ${EMPTY}
