*** Settings ***
Documentation       Step Definitions Mot de Passe
Resource            ../resources/pages/PageAjoutEmploye.resource
Library    String

*** Keywords ***

Naviguer Page Ajout Employe
    [Documentation]    Se Rendre sur la page pour modifier le mot de passe utilisateur
    PageAjoutEmploye.Go To AddEmployee Page
    ${actual_title}    PageAjoutEmploye.Get Page Title Text
    Should Be Equal As Strings    ${actual_title}    Add Employee


Remplir les champs du formulaire
    [Arguments]    ${employee}
    [Documentation]    Remplir les champs du formulaire avec Nom et Prénom 
    Log To Console    Remplir les champs du formulaire pour ajouter un employe
    PageAjoutEmploye.Set FirstName    ${employee}[firstName]
    PageAjoutEmploye.Set LastName    ${employee}[lastName]
    PageAjoutEmploye.Save Change

Verifier Succes Ajout Employe
    [Documentation]    Verifier que l'ajout a été un succès  
    Log To Console    Verifier ajout d'un employe
    ${message}    BasePages.Get Succes Message
    Should Contain   ${message}    Success

Verifier Echec Ajout Employe Input Vide
    [Documentation]    Verifier l'ajout d'un employe sans informations  
    Log To Console    Verifier ajout employe Vide
    [Arguments]    ${employee}
    FOR    ${input_name}    ${input_value}    IN    &{employee}
        IF    '${input_value}' == ''
            ${input_name_upper}    Convert To Upper Case    ${input_name}
            ${message_locator}    PageAjoutEmploye.Get required message    ${input_name_upper}
            Wait Until Element Contains    ${message_locator}    Required
        END
    END
    