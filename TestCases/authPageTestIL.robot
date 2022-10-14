*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/authPageKeywords.robot
Library     DataDriver  ../TestData/TestData.xlsx   sheet_name=InvalidData
Default Tags    Click for Details/Screenshot - Pass/Fail

test setup    Open my Browser       ${SiteUrl}    ${Browser}
test teardown    Close Browsers
Test Template   Invalid Credentials

*** Variables ***
${Browser}      headlesschrome
${SiteUrl}      https://supercrop-fe-staging.herokuapp.com/auth


*** Test Cases ***
LoginTest_InvalidCredentials ${invalidEmailData} ${invalidPasswordData}


*** Keywords ***
Invalid Credentials
    [Arguments]    ${invalidEmailData}     ${invalidPasswordData}
    Input invalidEmail    ${invalidEmailData}
    Click Password Login
    Input invalidPassword  ${invalidPasswordData}
    Click Password Login
    sleep    5
    TRY
        Error message - Invalid Email or Password
    EXCEPT
        TRY
            ERROR MESSAGE - EMAIL NOT CONFIRMED!
        EXCEPT
            TRY
                ERROR MESSAGE - PASSWORD IS REQUIRED
            EXCEPT
                page should not contain    Dashboard
            END
        END
    END
