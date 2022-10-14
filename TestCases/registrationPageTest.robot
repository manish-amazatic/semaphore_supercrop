*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/registrationPageKeywords.robot
Library    DataDriver   ../TestData/TestData.xlsx   sheet_name=RegistrationData
Default Tags    Click for Details/Screenshot - Pass/Fail

test setup    Open my Browser       ${SiteUrl}    ${Browser}
test teardown    Close Browsers
Test Template    Registration Details


*** Variables ***
${Browser}      headlesschrome
${SiteUrl}      https://supercrop-fe-staging.herokuapp.com/auth/registration


*** Test Cases ***
RegistrationTest ${firstNameData} ${lastNameData} ${phoneNumberData} ${emailData}


*** Keywords ***
Registration Details
    [Arguments]     ${firstNameData}    ${lastNameData}     ${phoneNumberData}      ${emailData}        ${cityData}     ${stateData}    ${fullAddData}      ${posData}      ${passData}     ${confirmPassData}
    Input First Name    ${firstNameData}
    Input Last Name    ${lastNameData}
    Input Phone Number      ${phoneNumberData}
    Input Email     ${emailData}
    Input City      ${cityData}
    Input State     ${stateData}
    Input Full Address      ${fullAddData}
    Input POS Code    ${posData}
    Input Password    ${passData}
    Input Confirm Password    ${confirmPassData}
    Agree Terms
    Submit
    TRY
        wait until page contains    Sign In
    EXCEPT
        wait until page contains    already exists
    END





