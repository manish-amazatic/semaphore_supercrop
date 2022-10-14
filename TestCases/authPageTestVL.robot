*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/authPageKeywords.robot
Library     DataDriver  ../TestData/TestData.xlsx   sheet_name=ValidData
Default Tags    Click for Details/Screenshot - Pass/Fail

test setup    Open my Browser       ${SiteUrl}    ${Browser}
test teardown    Close Browsers
Test Template   Valid Credentials

*** Variables ***
${Browser}      headlesschrome
${SiteUrl}      https://supercrop-fe-staging.herokuapp.com/auth


*** Test Cases ***
LoginTest_ValidCredentials ${validEmailData} ${validPasswordData}


*** Keywords ***
Valid Credentials
    [Arguments]    ${validEmailData}     ${validPasswordData}
    Input validEmail    ${validEmailData}
    Click Password Login
    Input validPassword  ${validPasswordData}
    Click Password Login
    wait until page contains    Dashboard

