*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.64:4000
${Browser}  headlesschrome
*** Test Cases ***
verifying ,user are not able to download a file , when you clicked on download butto
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
    ${c}=  Click Element   //*[@id="show_direct"]
    ${checking}     Set Variable    ${c}
    Run Keyword If  '${checking}'=='${c}'  ST1   ELSE    ST2
ST1
    Log To Console  file conatin download mark and file hasbeen downloaded in your file system
ST2
    Log To Console  usercannotdownloadafile