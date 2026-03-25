*** Settings ***
Documentation       Step Definitions Mot de Passe
Resource            ../resources/pages/PageMotDePasse.resource
Library             Collections

*** Keywords ***

Naviguer Page Changer Mdp
    [Documentation]    Se Rendre sur la page pour modifier le mot de passe utilisateur
    PageMotDePasse.Go To Password Page
    ${actual_title}    PageMotDePasse.Get Page Title Text
    Should Be Equal As Strings    ${actual_title}    Update Password


Remplir les champs du formulaire
    [Arguments]    ${compte}    ${nouveau_mdp}
    [Documentation]    Remplir les champs du formulaire avec l'ancien et le nouveau mot de passe 
    Log To Console    Remplir les champs du formulaire pour changer de mot de passe
    PageMotDePasse.Set Current Password    ${compte}[password]
    PageMotDePasse.Set New Password    ${nouveau_mdp}
    PageMotDePasse.Confirm New Password    ${nouveau_mdp}
    PageMotDePasse.Save Change

Verifier Succes Changement
    [Documentation]    Verifier que la modification a été un succès  
    Log To Console    Verifier modification du mot de passe
    ${message}    BasePages.Get Succes Message
    Should Contain   ${message}    Success

Modifier mon compte
    [Arguments]    ${compte}    ${nouveau_mdp}
    Set To Dictionary    ${compte}    password=${nouveau_mdp}
    