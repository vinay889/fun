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
    ${hac}=     Input Text  //*[@id="search_bar"]   can1.jpg
    ${done}     Set Variable    ${hac}
    Run Keyword If  '${done}'=='${hac}'    Satu   ELSE    Sagi
Satu
    Log To Console  fetched correct results

Sagi
    Log To Console  incorrect results
