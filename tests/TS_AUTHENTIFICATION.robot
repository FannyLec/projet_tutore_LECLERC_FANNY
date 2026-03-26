*** Settings ***
Documentation       Suite Authentification
Resource    ../resources/config/Variables.resource
Resource    ../resources/fixtures/BaseTests.resource
Resource    ../resources/keywords/StepConnexion.resource

Suite Setup         BaseTests.Suite Setup
Suite Teardown      BaseTests.Suite Teardown
Test Setup          BaseTests.Test Setup
Test Teardown       BaseTests.Test Teardown

Test Tags           type_tnr    browser_${BROWSER}


*** Test Cases ***
Se Connecter Compte Valide
    [Documentation]    Se Connecter Compte Valide
    [Tags]    test_positive
    StepConnexion.Se Connecter    ${COMPTE}
    StepConnexion.Verifier Connexion Ok

Se Connecter Compte Invalide
    [Documentation]    Se Connecter Compte Invalide
    [Tags]    test_negative
    &{compte_invalide}    Create Dictionary    username=123    password=123
    StepConnexion.Se Connecter    ${compte_invalide}
    StepConnexion.Verifier Connexion Input Invalide
    ${is_connected}    StepConnexion.Is Connected
    Should Not Be True    ${is_connected}

Se Connecter Sans Compte
    [Documentation]    Se Connecter Compte Vide
    [Tags]    test_negative
    &{compte_vide}    Create Dictionary    username=    password=
    StepConnexion.Se Connecter    ${compte_vide}
    StepConnexion.Verifier Connexion Input Vide     ${compte_vide}
    ${is_connected}    StepConnexion.Is Connected
    Should Not Be True    ${is_connected}

Se déconnecter
    [Documentation]    Se déconnecter
    [Tags]    test_positive
    ${connected}    StepConnexion.Is Connected
    IF    not ${connected}
        Run Keyword        StepConnexion.Se Connecter    ${COMPTE}
        Run Keyword        StepConnexion.Verifier Connexion Ok
    END
    StepConnexion.Se Deconnecter