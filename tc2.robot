*** Settings ***
Library  SeleniumLibrary
*** Variables ***
${Url}  http://192.168.43.6:4000
${Browser}  headlesschrome
*** Test Cases ***
Verifying with Wrong url
    [Tags]  tc2
    ${invalid}=     Open Browser    ${Url}    ${Browser}
    Title Should Be     invalidpage
    Pass Execution If   '${url}'=='FAIL'  wrongurlyoumentioned
    [Teardown]  Close Browser


