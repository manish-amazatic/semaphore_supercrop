*** Settings ***
Library    SeleniumLibrary
Resource    ../Resources/authPageKeywords.robot
Default Tags    Click for Details/Screenshot - Pass/Fail

suite setup    Open my Browser       ${SiteUrl}    ${Browser}
suite teardown    Close Browsers


*** Variables ***
${Browser}      headlesschrome
${SiteUrl}      https://supercrop-fe-staging.herokuapp.com/auth


*** Test Cases ***
PhoneOtp_InvalidNumbers
    input text    ${email}      1
    sleep    2
    input text    ${phone}      1234567890
    click element    ${otpLoginBtn}
    page should contain    Enter a valid phone number
    press keys    ${phone}      CONTROL+A+DELETE
    input text    ${email}      1
    sleep    2
    input text    ${phone}      2028129956
    click element    ${otploginbtn}
    page should contain     No account is associated with this phone number

PhoneOtp_ValidNumber
    press keys    ${phone}      CONTROL+A+DELETE
    input text    ${email}      1
    sleep    2
    click element    ${flagDropdown}
    sleep    2
    click element    ${indiaFlag}
    sleep    2
    input text    ${indiaPhoneNo}   9405282004
    click element    ${otploginbtn}
    TRY
        wait until page contains    Enter One Time Passcode Sent to
    EXCEPT
        wait until page contains    Unable to send Verification sms.
    END

EmailOtp_InvalidEmail
    go to   ${SiteUrl}
    sleep    2
    input text    ${email}      abcdxyz@gmail.com
    click element    ${otpLoginBtn}
    page should contain    No account is associated with this email

EmailOtp_ValidEmail
    press keys    ${email}      CONTROL+A+DELETE
    input text    ${email}      mahesh.m.joke@gmail.com
    click element    ${otpLoginBtn}
    wait until page contains    Enter One Time Passcode Sent to