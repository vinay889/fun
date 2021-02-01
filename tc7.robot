*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
Verify empty username and valid password this credentials
    Open Browser    ${Url}    ${Browser}
    Input Username  ${EMPTY}
    Input Password  viany143
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