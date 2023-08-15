*** Settings ***
Documentation             mon premier test
library                   SeleniumLibrary
Library    Dialogs
Resource                  ../Ressources/Keyword/Common/Commmon.robot
Resource                  ../Ressources/Keyword/01-Admin/userMangement.robot

Variables                 ../Ressources/Variables/Liste/utilisateur.yaml
Suite Setup               ouvrir navigateur
Test Setup                se loguer
Test Teardown             se deloguer
Suite Teardown            fermer navigateur

*** Test Cases ***
modifier un client3
    [Tags]         jira-127

    FOR    ${element}    IN    @{Utilisateur.users}
        Log    ${element}
        chercher un utilisateur                     ${element}
    END

