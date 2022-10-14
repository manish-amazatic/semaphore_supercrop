*** Settings ***
Library    SeleniumLibrary
Variables    ../PageObjects/registrationPageLocators.py


*** Keywords ***
Open my Browser
    [Arguments]    ${SiteUrl}   ${Browser}
    open browser    ${SiteUrl}  ${Browser}
    maximize browser window
    set selenium implicit wait    5 seconds

Close Browsers
    close all browsers

Input First Name
    [Arguments]    ${firstNameData}
    input text    ${firstName}      ${firstNameData}

Input Last Name
    [Arguments]    ${lastNameData}
    input text    ${lastName}       ${lastNameData}

Input Phone Number
    [Arguments]    ${phoneNumberData}
    input text    ${phoneNumber}    ${phoneNumberData}

Input Email
    [Arguments]    ${emailData}
    input text    ${email}      ${emailData}

Input City
    [Arguments]    ${cityData}
    input text    ${city}   ${cityData}

Input State
    [Arguments]    ${stateData}
    input text    ${state}      ${stateData}

Input Full Address
    [Arguments]    ${fullAddData}
    input text    ${fullAddress}    ${fullAddData}

Input POS Code
    [Arguments]    ${posData}
    input text    ${posCode}    ${posData}

Input Password
    [Arguments]    ${passData}
    input text    ${password}   ${passData}

Input Confirm Password
    [Arguments]    ${confirmPassData}
    input text    ${confirmPassword}    ${confirmPassData}

Agree Terms
    click element    ${acceptTerms}

Submit
    click element    ${submitbtn}

Cancel
    click element    ${cancel}