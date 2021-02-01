*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
verifying,the download mark in the right-hand end of the file if its not showing
    [Tags]  uploadoption
    Set Selenium Speed      1 seconds
    Open Browser    ${Url}    ${Browser}
    Input Username  vinay
    Input Password  ivtree123
    Submit Credentials
    Welcome Page Should Be Open
    OpenaDirectorie
    VerifyingDownloadMark
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
VerifyingDownloadMark
    ${can}=     Get WebElement  //*[@id="show_direct"]
    ${mark}     Set Variable    ${can}
    Run Keyword If  '${mark}'=='${can}'  statement1     ELSE    statement2
statement1
    Log To Console      Filecontainsdownloadmark
statement2
    Log To Console      No Downloadmark