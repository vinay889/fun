*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
Verify login with emptyuser name and empty password
#    [Tags]  tc3
    Open Browser    ${Url}    ${Browser}
    Input Username  ${EMPTY}
    Input Password  ${EMPTY}
    Submit Credentials
    Welcome Page Should Be Open
    condition
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
condition
    ${pa}   Set Variable  NAS GATEWAY
    Run Keyword If  '${pa}'=='NAS GATEWAY'    Log To Console  inavalid username and invalid password


