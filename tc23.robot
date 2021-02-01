*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
verify the filtering leads to wrong results when you are searching.
    Open Browser    ${Url}    ${Browser}
    Set Selenium Speed      1 seconds
    Input Username  vinay
    Input Password  ivtree123
    Submit Credentials
    Welcome Page Should Be Open
    Checkingfilterresults
    [Teardown]  Close Browser
*** Keywords ***
Input Username
    [Arguments]    ${Username}
    Input Text     //input[@name='username']   ${Username}
Input Password
    [Arguments]    ${Password}
    Input Text     //input[@name='password']   ${Password}
Submit Credentials
    Click Button    login_button
Welcome Page Should Be Open
    Title Should Be    NAS GATEWAY
Checkingfilterresults
    Click Element   //*[@id="add"]
    Input Text  //*[@id="search_bar"]   can1.jpg
    ${clean}=   Clear Element Text     //*[@id="search_bar"]
    ${clan}     Set Variable    ${clean}
    Run Keyword If  '${clan}'=='${clean}'   Satu   ELSE    Sagi
Satu
    Log To Console  cleared

Sagi
    Log To Console  Not cleared