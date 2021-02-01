*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
Verified, Upload Is Failing If There No Choose File option
   [Tags]  choosefile
    Set Selenium Speed      1 seconds
    Open Browser    ${Url}    ${Browser}
    Input Username  vinay
    Input Password  ivtree123
    Submit Credentials
    Welcome Page Should Be Open
    ClickonUpload
    Thereischoosefile
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
ClickonUpload
    Click Element   //*[@id="add"]
    Click Element   //*[@id="upload"]
Thereischoosefile
    ${file}=    Choose File     //*[@id="file"]     C:/smbtest/can1.jpg
    ${verifying}    Set Variable  ${file}
    Run Keyword If  '${verifying}'=='${file}'   conform     ELSE    Nochoosefile
conform
    Log     Choose file option is there
Nochoosefile
    Log   No Choose file option


