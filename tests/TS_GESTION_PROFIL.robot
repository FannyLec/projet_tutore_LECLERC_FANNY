*** Settings ***
Documentation       Suite Authentification
Resource    ../resources/config/Variables.resource
Resource    ../resources/fixtures/BaseTests.resource
Resource    ../resources/keywords/StepMotDePasse.resource
Resource    ../resources/keywords/StepConnexion.resource

Suite Setup         BaseTests.Suite Setup
Suite Teardown      BaseTests.Suite Teardown
Test Setup          BaseTests.Test Setup
Test Teardown       BaseTests.Test Teardown

Test Tags           type_tnr    browser_${BROWSER}


*** Test Cases ***
Changer de mot de passe
    [Documentation]    Changer de mot de passe
    [Tags]    test_positive
    ${connected}    StepConnexion.Is Connected
    IF    not ${connected}
        Run Keyword        StepConnexion.Se Connecter    ${COMPTE}
        Run Keyword        StepConnexion.Verifier Connexion Ok
    END
    StepMotDePasse.Naviguer Page Changer Mdp
    StepMotDePasse.Remplir les champs du formulaire    ${compte}    test1234
    StepMotDePasse.Verifier Succes Changement
    StepMotDePasse.Modifier mon compte    ${compte}    test1234
    StepConnexion.Se Deconnecter
    StepConnexion.Se Connecter    ${compte}
    StepConnexion.Verifier Connexion Ok    
