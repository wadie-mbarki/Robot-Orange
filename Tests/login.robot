*** Settings ***
Resource                   ../Ressources/Keyword/Common/DataManager.robot
Resource                   ../Ressources/Keyword/Common/Commmon.robot

Test Setup                 ouvrir navigateur
Test Teardown              fermer navigateur
*** Variables ***
${path} =   D:\\Stage\\amazon\\Ressources\\Variables\\Data\\Users.csv
*** Test Cases ***
test login page
    ${invalidLoginScenarios} =  Get CSV data    ${path}
    Log To Console    debut test
    se loguer avec des invalides donnees    ${invalidLoginScenarios}