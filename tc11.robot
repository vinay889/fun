*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.162:4000
${Browser}  headlesschrome
*** Test Cases ***
Verify Cancel Button Or Not Able To Cancel Your Upload
    Open Browser    ${Url}    ${Browser}
    Set Selenium Speed      1 seconds
    Input Username  vinay
    Input Password  ivtree123
    Submit Credentials
    Welcome Page Should Be Open
    UploadCancelation
    SelectfilenameandCancelUpload
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
UploadCancelation
    Page Should Contain Element     //*[@id="upload"]
    Sleep   2    
    Click Element   //*[@id="add"]/span[1]/mat-icon
    Click Element   upload
SelectfilenameandCancelUpload
    Choose File     //*[@id="file"]     C:/smbtest/can1.jpg
    ${candA}=   Click Element   //*[@id="cancel"]
    ${cancel}   Set Variable    ${candA}
    Run Keyword If  '${cancel}'=='${candA}'    statement1   ELSE    statement2
statement1
    Log      User able to cancel upload
statement2
    Log      usercanot cancel
