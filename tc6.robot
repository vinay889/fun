*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
Verify Case changed username and password
    Open Browser    ${Url}    ${Browser}
    Input Username  UsEr1
    Input Password  ViNaY143
    Submit Credentials
    Welcome Page Should Be Open
    [Teardown]    Close Browser
*** Keywords ***
Input Username
    [Arguments]    ${Username}
     Input Text    //input[@name='username']    ${Username}
Input Password
    [Arguments]    ${Password}
    Input Text    //input[@name='password']    ${Password}
Submit Credentials
    Click Button    login_button
Welcome Page Should Be Open
    Title Should Be    NAS GATEWAY