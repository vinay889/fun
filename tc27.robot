*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
check and verify that plus button at the end of directories and check able to clic
    [Tags]  plus
    Set Selenium Speed      1 seconds
    Open Browser    ${Url}    ${Browser}
    Maximize Browser Window
    Input Username  vinay
    Input Password  ivtree123
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
OpenaDirectorie
    Click Element   //*[@id="add"]
