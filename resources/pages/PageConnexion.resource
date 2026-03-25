*** Settings ***
Resource    BasePages.resource

*** Variables ***
${LOCATOR_INPUT_USERNAME}    //*[@name="username"]
${LOCATOR_INPUT_PASSWORD}    //*[@name="password"]
${LOCATOR_BUTTON_LOGIN}    //button[@type="submit"]
${LOCATOR_MESSAGE_REQUIRED}    /../following-sibling::span
${LOCATOR_MESSAGE_INVALID}    //*[@class="orangehrm-login-error"]//p[text()="Invalid credentials"]

*** Keywords ***


Set Username
    [Arguments]    ${texte}
    SeleniumLibrary.Input Text    ${LOCATOR_INPUT_USERNAME}    ${texte}

Set Password
    [Arguments]    ${texte}
    SeleniumLibrary.Input Password    ${LOCATOR_INPUT_PASSWORD}    ${texte}

Login
    SeleniumLibrary.Click Element    ${LOCATOR_BUTTON_LOGIN} 

Get required message
    [Arguments]    ${input_name}
    Wait Until Element Is Visible    ${LOCATOR_INPUT_${input_name}}${LOCATOR_MESSAGE_REQUIRED}
    ${message}    Get Text    ${LOCATOR_INPUT_${input_name}}${LOCATOR_MESSAGE_REQUIRED}
    RETURN    ${message}

Get invalid message
    Wait Until Element Is Visible    ${LOCATOR_MESSAGE_INVALID}
    ${message}    Get Text    ${LOCATOR_MESSAGE_INVALID}
    RETURN    ${message}