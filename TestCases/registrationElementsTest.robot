*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/registrationPageKeywords.robot
Default Tags    Click for Details/Screenshot - Pass/Fail

suite setup    Open my Browser       ${SiteUrl}    ${Browser}
suite teardown    Close Browsers


*** Variables ***
${Browser}      headlesschrome
${SiteUrl}      https://supercrop-fe-staging.herokuapp.com/auth/registration


*** Test Cases ***
FirstName
    [Documentation]    Testing First Name input with non-alphabets
    input text    ${firstName}      123$%^
    click element    ${createAnAccount}
    wait until page contains    Only alphabets are allowed for this field

LastName
    [Documentation]    Testing Last Name input with non-alphabets
    input text    ${lastName}       123$%^
    click element   ${createAnAccount}
    wait until page contains    Only alphabets are allowed for this field

Email1
    [Documentation]    Testing Email input with wrong email format
    input text    ${email}      abc@gmail.
    click element    ${createAnAccount}
    wait until page contains    Wrong email format

Email2
    [Documentation]    Testing Email input with wrong email format
    press keys    ${email}      CONTROL+A+DELETE
    input text    ${email}      abc-gmail.com
    click element    ${createAnAccount}
    wait until page contains    Wrong email format

City
    [Documentation]    Testing City input with non-alphabets
    input text    ${city}   123$%^
    click element    ${createAnAccount}
    wait until page contains    Only alphabets are allowed for this field

State
    [Documentation]    Testing State input with non-alphabets
    input text    ${state}  123$%^
    click element    ${createAnAccount}
    wait until page contains    Only alphabets are allowed for this field

PosCode
    [Documentation]    Testing Pos input with special characters
    input text    ${posCode}    %$()
    click element    ${createAnAccount}
    wait until page contains    Only alphabets and numbers are allowed for this field



