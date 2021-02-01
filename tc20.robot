*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
Verifying with if there is no upload option
    [Tags]  uploadoption
    Set Selenium Speed      1 seconds
    Open Browser    ${Url}    ${Browser}
    Input Username  vinay
    Input Password  ivtree123
    Submit Credentials
    Welcome Page Should Be Open
    Checkingupload
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
Checkingupload
    ${cand1}=    Get WebElement   //*[@id="upload"]
    Run Keyword If  ${cand1}     Statement1    ELSE    Statement2
Statement1
    Log To Console      Upload button is there yes
statement2
    Log To Console      NO Upload button is there



