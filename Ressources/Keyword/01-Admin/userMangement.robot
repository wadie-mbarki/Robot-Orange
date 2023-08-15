*** Settings ***
Library                         SeleniumLibrary
Resource                        ../Common/Commmon.robot
Variables                       ../../Variables/Locator/Admin.yaml
Variables                       ../../Variables/Liste/utilisateur.yaml
*** Keywords ***
chercher un utilisateur
    [Arguments]                 ${souris}
    aller au link               Admin
    Log To Console              on insere le nom de l'utilisateur a cherche
    Input Text                  ${Admin.SystemsUsers.Username.locator}                      ${Utilisateur.users.${souris}.Username}
    Sleep                       ${ExecutionSettings.Time_Stay}
    Click Button                ${Admin.SystemsUsers.btn_Search.locator}
    Sleep                       ${ExecutionSettings.Time_Stay}