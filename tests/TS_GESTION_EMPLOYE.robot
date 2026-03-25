*** Settings ***
Documentation       Suite Authentification
Resource    ../resources/config/Variables.resource
Resource    ../resources/fixtures/BaseTests.resource
Resource    ../resources/keywords/StepAjoutEmploye.resource
Resource    ../resources/keywords/StepListEmploye.resource
Resource    ../resources/keywords/StepConnexion.resource

Suite Setup         BaseTests.Suite Setup
Suite Teardown      BaseTests.Suite Teardown
Test Setup          BaseTests.Test Setup
Test Teardown       BaseTests.Test Teardown

Test Tags           type_tnr    browser_${BROWSER}


*** Test Cases ***
Ajouter Un Employe Ok
    [Documentation]    Ajouter un employe ok
    [Tags]    test_positive
    ${connected}    StepConnexion.Is Connected
    IF    not ${connected}
        Run Keyword        StepConnexion.Se Connecter    ${COMPTE}
        Run Keyword        StepConnexion.Verifier Connexion Ok
    END
    StepAjoutEmploye.Naviguer Page Ajout Employe
    ${employee}    Create Dictionary    firstName=John    lastName=Smith
    StepAjoutEmploye.Remplir les champs du formulaire    ${employee}
    StepAjoutEmploye.Verifier Succes Ajout Employe
 
Ajouter Un Employe Ko
    [Documentation]    Ajouter un employe ko
    [Tags]    test_negative
    ${connected}    StepConnexion.Is Connected
    IF    not ${connected}
        Run Keyword        StepConnexion.Se Connecter    ${COMPTE}
        Run Keyword        StepConnexion.Verifier Connexion Ok
    END
    StepAjoutEmploye.Naviguer Page Ajout Employe
    ${employee}    Create Dictionary    firstName=""    lastName=""
    StepAjoutEmploye.Remplir les champs du formulaire    ${employee}
    StepAjoutEmploye.Verifier Echec Ajout Employe Input Vide    ${employee}

Supprimer Employe
    [Documentation]    Supprimer un employe
    [Tags]    test_positive
    ${connected}    StepConnexion.Is Connected
    IF    not ${connected}
        Run Keyword        StepConnexion.Se Connecter    ${COMPTE}
        Run Keyword        StepConnexion.Verifier Connexion Ok
    END
    StepListEmploye.Naviguer Page Liste Employe
    ${employee}    Create Dictionary    firstName=John    lastName=Smith
    StepListEmploye.Rechercher Employe Par Nom    ${employee}
    StepListEmploye.Supprimer Employe    ${employee}
    StepListEmploye.Verifier Succes Suppression