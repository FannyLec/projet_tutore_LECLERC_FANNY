*** Settings ***
Documentation       Step Definitions Connexion
Resource            ../resources/pages/PageConnexion.resource
Library    String

*** Variables ***
${LOCATOR_HEADER_BAR}    //*[@class="oxd-topbar-header"]

*** Keywords ***
Se Connecter
    [Documentation]    Se Connecter
    [Arguments]    ${compte}
    Log To Console    Se connecter 
    PageConnexion.Set Username    ${compte}[username]
    PageConnexion.Set Password    ${compte}[password]
    PageConnexion.Login

Verifier Connexion Ok
    [Documentation]    Verifier Connexion Ok
    Log To Console    Verifier Connexion Ok
    BasePages.Check Connection

Verifier Connexion Input Invalide
    [Documentation]    Verifier la connexion avec des informations invalides  
    Log To Console    Verifier Connexion Invalide
    ${message}    PageConnexion.Get invalid message
    Should Contain   ${message}    Invalid

Verifier Connexion Input Vide
    [Documentation]    Verifier la connexion sans informations utilisateurs  
    Log To Console    Verifier Connexion Vide
    [Arguments]    ${compte}
    FOR    ${input_name}    ${input_value}    IN    &{compte}
        IF    '${input_value}' == ''
            ${input_name_upper}    Convert To Upper Case    ${input_name}
            ${message_locator}    PageConnexion.Get Required Message    ${input_name_upper}
            Wait Until Element Contains    ${message_locator}    Required
        END
    END

Is Connected
    ${status}=    Run Keyword And Return Status
    ...    Page Should Contain Element    ${LOCATOR_HEADER_BAR}
    RETURN    ${status}

Se Deconnecter
    [Documentation]    Se Deconnecter
    Log To Console    Se Deconnecter
    BasePages.Logout

