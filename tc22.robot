*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
verify the filter option multiple times ,properly working fine or not
    [Tags]  tc22
    Open Browser    ${Url}    ${Browser}
    Set Selenium Speed      1 seconds
    Input Username  vinay
    Input Password  ivtree123
    Submit Credentials
    Welcome Page Should Be Open
    Checkingfilter
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
Checkingfilter
    Click Element   //*[@id="add"]
    Click Element   //*[@id="search_bar"]
    Click Element   //*[@id="search_bar"]
    Click Element   //*[@id="search_bar"]
    Click Element   //*[@id="search_bar"]
    Click Element   //*[@id="search_bar"]
