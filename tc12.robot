*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
${files}    C:/smbtest/can1.jpg   C:/smbtest/can2.jpg
*** Test Cases ***
Verify that multiple files can be uploaded at a time
    [Tags]  tc12
    Open Browser    ${Url}    ${Browser}
    Set Selenium Speed      1 seconds
    Input Username  vinay
    Input Password  ivtree123
    Submit Credentials
    Welcome Page Should Be Open
    Uploading
    FilesAcceptingcondition
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
Uploading
    Page Should Contain Element     //*[@id="upload"]   upload
    Sleep   2
    Click Element   //*[@id="add"]
    Click Element   //*[@id="upload"]
FilesAcceptingcondition
    ${candA}=   Choose File   //*[@id="file"]     ${files}
    ${candB}    Set Varible     ${candA}
    Run Keyword If  '${candB}'=='{candA}'   s1  ELSE    s2
s1
    Log To Console  YES
s2
    Log To Console  No