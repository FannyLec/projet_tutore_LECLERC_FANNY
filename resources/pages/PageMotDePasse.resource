*** Settings ***
Resource    BasePages.resource

*** Variables ***
${URL}    web/index.php/pim/updatePassword
${LOCATOR_MAIN_TITLE}    //h6[contains(@class,"orangehrm-main-title")]
${LOCATOR_CURRENT_PASSWORD}    //label[contains(text(),"Current")]/../..//input
${LOCATOR_PASSWORD}    //label[text()="Password"]/../..//input
${LOCATOR_CONFIRM_PASSWORD}    //label[contains(text(),"Confirm")]/../..//input
${LOCATOR_BUTTON_SAVE}    //button[@type="submit"]

*** Keywords ***

Go To Password Page
    BasePages.Go to Page    ${URL}
    Wait Until Page Contains Element    ${LOCATOR_MAIN_TITLE}    timeout=10s

Get Page Title Text
    ${actual_title}    Get Text    ${LOCATOR_MAIN_TITLE}
    RETURN   ${actual_title}

Set Current Password
    [Arguments]    ${current_password}
    SeleniumLibrary.Input Text    ${LOCATOR_CURRENT_PASSWORD}    ${current_password}

Set New Password
    [Arguments]    ${new_password}
    SeleniumLibrary.Input Text    ${LOCATOR_PASSWORD}    ${new_password}

Confirm New Password
    [Arguments]    ${new_password}
    SeleniumLibrary.Input Text    ${LOCATOR_CONFIRM_PASSWORD}    ${new_password}

Save Change
    SeleniumLibrary.Click Element    ${LOCATOR_BUTTON_SAVE}     
