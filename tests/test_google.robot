*** Settings ***
Library    SeleniumLibrary
Variables    ../resources/env_vars.py

*** Variables ***

${URL}        https://www.google.com

*** Test Cases ***
Ouvrir Google
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Google
    Close Browser
Test Variable
    Log To Console    USER=${USER_NAME}
    Log To Console    PASSWORD=${PASSWORD}