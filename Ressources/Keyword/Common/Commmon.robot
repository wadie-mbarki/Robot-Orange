*** Settings ***
Library                             SeleniumLibrary
Variables                           ../../Variables/Common/LoginDataInput.yaml
Variables                           ../../Variables/Locator/LoginPage.yaml
Variables                           ../../Variables/Common/ExecutionSettings.yaml
Variables                           ../../Variables/Locator/MenuPageAcceuil.yaml
*** Keywords ***
ouvrir navigateur
    [Documentation]    Ce keyword sert a ouvrir le navigateur 
    Log To Console                  open browser
    Set Selenium Speed              .2s
    Set Selenium Timeout            10s
    Open Browser                    ${ExecutionSettings.url}                            ${ExecutionSettings.browser}
    Log To Console                  browser ouvret
    Log To Console                  ${ExecutionSettings.url}
    Maximize Browser Window
    Log To Console                  brower maximisé
    Sleep    3
    Page Should Contain             © 2005 - 2023 OrangeHRM, Inc. All rights reserved.
se loguer 
    [Documentation]    Ce keyword sert a se loguer 
    Log To Console                  se loguer
    Sleep                           ${ExecutionSettings.Time_Stay}
    Page Should Contain             Login
    Wait Until Page Contains        ${LoginLocator.Username.description}
    Input Text                      ${LoginLocator.Username.locator}                    ${LoginDataInput.Users.user1.username}
    Log To Console                  username insere
    Input Password                  ${LoginLocator.Password.locator}                    ${LoginDataInput.Users.user1.password}
    Log To Console                  password insere
    Click Button                    ${LoginLocator.btn_Login.locator}
    Log To Console                  bouton login cliqué
    Sleep                           ${ExecutionSettings.Time_Stay}
se deloguer
    [Documentation]     Ce keyword est pour se deloguer
    Log To Console                  se deloguer
    Sleep                           ${ExecutionSettings.Time_Stay}
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/span
    Click Element    //*[@id="app"]/div[1]/div[1]/header/div[1]/div[2]/ul/li/ul/li[4]/a
    Sleep                           ${ExecutionSettings.Time_Stay}
fermer navigateur
    [Documentation]    Ce keyword sert a se loguer 
    Log To Console                  femer le navigateur
    Close All Browsers
aller au link
    [Arguments]                     ${link_menu}
    Wait Until Page Contains        ${link_menu}
    Log To Console                  on va cliquer sur le lien : ${link_menu}
    Click Element                   ${MenuPageAcceuil.${link_menu}.locator}
    Log To Console                  le lien :${link_menu} est cliqué
    Wait Until Page Contains        ${MenuPageAcceuil.${link_menu}.description}
    Sleep                           ${ExecutionSettings.Time_Stay}
se loguer avec des invalides donnees
    [Documentation]    Ce keyword sert a se loguer avec des invalides donnes
    [Arguments]         ${Credentials}
    Log To Console                  se loguer invalid1
    FOR    ${element}    IN    @{Credentials}
        Log    ${element}
          Log To Console                  se loguer invalid
          Sleep                           ${ExecutionSettings.Time_Stay}
          Page Should Contain             Login
          Wait Until Page Contains        ${LoginLocator.Username.description}
          Input Text                      ${LoginLocator.Username.locator}                    ${element[0]}
          Log To Console                  username insere
          Input Password                  ${LoginLocator.Password.locator}                    ${element[1]}
          Log To Console                  password insere
          Click Button                    ${LoginLocator.btn_Login.locator}
          Log To Console                  bouton login cliqué
          Sleep                           ${ExecutionSettings.Time_Stay}
    END

