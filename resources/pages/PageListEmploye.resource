*** Settings ***
Resource    BasePages.resource
Library    String

*** Variables ***
${URL_LIST}    web/index.php/pim/viewEmployeeList
${LOCATOR_ITEM_MENU}    //nav[@aria-label="Topbar Menu"]//li[2]
${LOCATOR_SEARCH_TITLE}    //h5[text()="Employee Information"]
${LOCATOR_INPUT_SEARCH_BYNAME}    //label[@class="oxd-label" and text()="Employee Name"]/../..//input
${LOCATOR_BUTTON_SEARCH}    //button[@type="submit"]
${LOCATOR_CELL_FIRSTNAME}    //*[@class="oxd-table-card"]//*[@role="cell"][3]
${LOCATOR_CELL_LASTNAME}    //*[@class="oxd-table-card"]//*[@role="cell"][4]
${LOCATOR_BUTTON_DELETE}    //*[@class="oxd-table-card"]//*[@role="cell"][9]//i[@class="oxd-icon bi-trash"]
${LOCATOR_MODAL_DELETE}    //*[@role="document"]
${LOCATOR_BUTTON_CONFIRM_DELETE}    //*[@role="document"]//i/..

*** Keywords ***
Go To ListEmployee Page
    BasePages.Go to Page    ${URL_LIST}
    Click Element    ${LOCATOR_ITEM_MENU}
    Wait Until Page Contains Element    ${LOCATOR_SEARCH_TITLE}     timeout=20s

Get Page Title Text
    ${actual_title}    Get Text    ${LOCATOR_SEARCH_TITLE} 
    RETURN   ${actual_title}

Set Employee Name
    [Arguments]    ${employee}
    SeleniumLibrary.Input Text    ${LOCATOR_INPUT_SEARCH_BYNAME}    ${employee}[firstName] ${employee}[lastName]

Search employee
    SeleniumLibrary.Click Element    ${LOCATOR_BUTTON_SEARCH}    

Get Cell Firstname
    Scroll Element Into View    ${LOCATOR_CELL_FIRSTNAME}
    Wait Until Element Contains    ${LOCATOR_CELL_FIRSTNAME}    John
    ${firstName}    Get Text    ${LOCATOR_CELL_FIRSTNAME}
    ${firstName}=    Replace String    ${firstName}    '    ${EMPTY}
    Log To Console    Get name : ${firstname}
    RETURN    ${firstName}

Get Cell Lastname
    ${lastName}    Get Text    ${LOCATOR_CELL_LASTNAME} 
    ${lastName}=     Replace String    ${lastName}     '    ${EMPTY}
    RETURN    ${lastName}

Delete Employee
    SeleniumLibrary.Click Element    ${LOCATOR_BUTTON_DELETE} 

Check Modal
    Wait Until Page Contains Element    ${LOCATOR_MODAL_DELETE}

Confirm Delete 
    SeleniumLibrary.Click Element    ${LOCATOR_BUTTON_CONFIRM_DELETE}