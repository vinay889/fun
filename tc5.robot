*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
verifying the link of logout is clickable when a user is logged-in.
    Open Browser    ${Url}    ${Browser}
    Set Selenium Speed      1 seconds
    Maximize Browser Window
    Input Username  USER1USER1UAER1USER1
    Input Password  vinay143vinay143viay143
    Submit Credentials
    Welcome Page Should Be Open
    OpenaDirectorie
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
