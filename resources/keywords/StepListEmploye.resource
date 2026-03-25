*** Settings ***
Documentation       Step Definitions Mot de Passe
Resource            ../resources/pages/PageListEmploye.resource
Library             Collections

*** Keywords ***

Naviguer Page Liste Employe
    [Documentation]    Se Rendre sur la page pour consulter la liste employe
    PageListEmploye.Go To ListEmployee Page
    ${actual_title}    PageListEmploye.Get Page Title Text
    Should Be Equal As Strings    ${actual_title}    Employee Information

Rechercher Employe Par Nom
    [Arguments]    ${employee}
    PageListEmploye.Set Employee Name    ${employee}
    PageListEmploye.Search employee

Supprimer Employe
    [Arguments]    ${employee}
    ${firstName}    PageListEmploye.Get Cell Firstname
    ${lastName}    PageListEmploye.Get Cell Lastname
    IF    ${firstName} == ${employee}[firstName] and ${lastName}==${employee}[lastName]
        PageListEmploye.Delete Employee
        PageListEmploye.Check Modal
        PageListEmploye.Confirm Delete
    END
    
Verifier Succes Suppression
    [Documentation]    Verifier que la suppression a été un succès  
    Log To Console    Verifier suppression employe
    ${message}    BasePages.Get Succes Message
    Should Contain   ${message}    Success