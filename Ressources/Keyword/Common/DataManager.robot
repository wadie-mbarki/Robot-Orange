*** Settings ***
Documentation           use this layer to get data from external files
Library                 ../../../LibraryWadie/CustomLibs/Csv.py

*** Keywords ***
Get CSV data
    [Arguments]             ${FilePath}
    ${Data} =   Read Csv File  ${FilePath}
    [Return]   ${Data}