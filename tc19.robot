*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
${files}    C:/smbtest/can1.jpg   C:/smbtest/can2.jpg
*** Test Cases ***
Verify that multiple files can be uploaded at a time
#    [Tags]  tc19
    Open Browser    ${Url}    ${Browser}
    Set Selenium Speed      1 seconds
    Input Username  vinay
    Input Password  ivtree123
    Submit Credentials
    Welcome Page Should Be Open
    LogoutOptionChecking
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
LogoutOptionChecking
    ${cap}=     Click Element   //*[@id="logout"]
    ${logout}   Set Variable    ${cap}
    Run Keyword If  '${logout}'=='${cap}'  statement1     ELSE    statement2
statement1
    Log To Console  UserLogedout
statement2
    Log To Console  UserNotlogout



