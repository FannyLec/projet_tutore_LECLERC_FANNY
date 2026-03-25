*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/config/Variables.resource
Resource    ../resources/fixtures/BaseTests.resource


Suite Setup         BaseTests.Suite Setup
Suite Teardown      BaseTests.Suite Teardown
Test Setup          BaseTests.Test Setup
Test Teardown       BaseTests.Test Teardown


*** Test Cases ***
Ouvrir Orange

    Title Should Be    OrangeHRM
Test Variable
    Log To Console    COMPTE=${COMPTE}

    