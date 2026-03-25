*** Settings ***
Library    SeleniumLibrary
Resource    ../config/Variables.resource

*** Variables ***
${LOCATOR_HEADER_BAR}    //*[@class="oxd-topbar-header"]
${LOCATOR_HEADER_TITLE}    //*[@class="oxd-topbar-header"]//h6
${LOCATOR_DASHBOARD_MENU}    //ul[@class="oxd-main-menu"]/li[8]
${LOCATOR_DROPDOWN_USER}    //*[@class="oxd-userdropdown-tab"]
${LOCATOR_LOGOUT_ITEM}    //*[@class="--active oxd-userdropdown"]//li[4]
${LOCATOR_SUCCESS_MESSAGE}    //*[@id="oxd-toaster_1"]//p


*** Keywords ***
Check Connection
    SeleniumLibrary.Wait Until Page Contains Element    ${LOCATOR_HEADER_BAR}
    SeleniumLibrary.Wait Until Location Does Not Contain    /login

Logout
    SeleniumLibrary.Click Element    ${LOCATOR_DROPDOWN_USER}
    SeleniumLibrary.Wait Until Element Is Visible    ${LOCATOR_LOGOUT_ITEM}
    SeleniumLibrary.Click Element    ${LOCATOR_LOGOUT_ITEM}
    SeleniumLibrary.Wait Until Location Contains    /login    message=La déconnexion a échoué

Return Dashboard Page
    SeleniumLibrary.Click Element    ${LOCATOR_DASHBOARD_MENU} 
    SeleniumLibrary.Wait Until Element Contains    ${LOCATOR_HEADER_TITLE}    Dashboard   

Go to Page
    [Arguments]    ${END_URL}
    Go To    ${BASE_URL}${END_URL}

Get Succes Message
    Wait Until Element Is Visible    ${LOCATOR_SUCCESS_MESSAGE}
    ${message}    Get Text    ${LOCATOR_SUCCESS_MESSAGE}
    RETURN    ${message}