*** Settings ***
Resource    BasePages.resource

*** Variables ***
${URL}    web/index.php/pim/addEmployee
${LOCATOR_MAIN_TITLE}    //h6[contains(@class,"orangehrm-main-title")]
${LOCATOR_INPUT_FIRSTNAME}    //input[@name="firstName"]
${LOCATOR_INPUT_LASTNAME}    //input[@name="lastName"]
${LOCATOR_MESSAGE_REQUIRED}    /../../span
${LOCATOR_BUTTON_SAVE}    //button[@type="submit"]

*** Keywords ***

Go To AddEmployee Page
    BasePages.Go to Page    ${URL}
    Wait Until Page Contains Element    ${LOCATOR_MAIN_TITLE}    timeout=10s

Get Page Title Text
    ${actual_title}    Get Text    ${LOCATOR_MAIN_TITLE}
    RETURN   ${actual_title}

Set FirstName
    [Arguments]    ${texte}
    SeleniumLibrary.Input Text    ${LOCATOR_INPUT_FIRSTNAME}     ${texte}

Set LastName
    [Arguments]    ${texte}
    SeleniumLibrary.Input Text    ${LOCATOR_INPUT_LASTNAME}    ${texte}

Get required message
    [Arguments]    ${input_name}
    Wait Until Element Is Visible    ${LOCATOR_INPUT_${input_name}}${LOCATOR_MESSAGE_REQUIRED}
    ${message}    Get Text    ${LOCATOR_INPUT_${input_name}}${LOCATOR_MESSAGE_REQUIRED}
    RETURN    ${message}

Save Change
    Wait Until Element Is Visible    ${LOCATOR_BUTTON_SAVE}
    SeleniumLibrary.Click Element    ${LOCATOR_BUTTON_SAVE}  