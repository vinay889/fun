*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  chrome
*** Test Cases ***
verify what files you are uploading,which you have already uploaded
    Open Browser    ${Url}    ${Browser}
    Set Selenium Speed      1 seconds
    Input Username  vinay
    Input Password  ivtree123
    Submit Credentials
    Welcome Page Should Be Open
    Reuploadingoffile
    reselectingsamefile
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
Reuploadingoffile
    Page Should Contain Element     //*[@id="upload"]
    Sleep   2
    Click Element   //*[@id="add"]
    Click Element   //*[@id="upload"]
reselectingsamefile
    Choose File     //*[@id="file"]    C:/smbtest/can1.jpg
    ${reupload}=    Click Element   //*[@id="upload1"]
    ${status}   Set Variable    ${reupload}
    Run Keyword If  '${status}'=='${reupload}'  Log To Console   your file will reload