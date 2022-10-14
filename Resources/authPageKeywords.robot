*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/authLocators.py


*** Keywords ***
Open my Browser
    [Arguments]    ${SiteUrl}   ${Browser}
    open browser    ${SiteUrl}  ${Browser}
    maximize browser window
    set selenium implicit wait    5 seconds

Close Browsers
    close all browsers

Input invalidEmail
    [Arguments]    ${invalidEmailData}
    input text    ${email}      ${invalidEmailData}

Input validEmail
    [Arguments]    ${validEmailData}
    input text    ${email}      ${validEmailData}

Click Password Login
    click element    ${passwordloginbtn}

Input invalidPassword
    [Arguments]    ${invalidPasswordData}
    input text    ${password}   ${invalidPasswordData}

Input validPassword
    [Arguments]    ${validPasswordData}
    input text    ${password}   ${validPasswordData}

Clear Text
    clear element text    ${email}
    clear element text    ${password}

Error message - Invalid Email or Password
    page should contain    Invalid Email or Password

Error message - Email not confirmed!
    page should contain    Email not confirmed! Please click the confirmation link sent your registered email.

Error message - Password is required
    page should contain    Password is required

Verify Link Presence
    [Arguments]     ${linkLocator}
    page should contain link    ${linkLocator}


