*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://testautomationplayground.northeurope.cloudapp.azure.com:8080/
${username}    hjm
${password}    4321

*** Test Cases ***
Assignments
    open browser    ${URL}    Chrome
    maximize browser window
    Put in an order and verify
    Log in to playground
    Verify checkout page   €50.00
    close browser

*** Keywords ***
Log in to playground
    click element    xpath://button/span[text()='Sign in']
    input text    xpath://input[@formcontrolname='username']    ${username}
    sleep    1
    input text    xpath://input[@formcontrolname='password']    ${password}
    sleep    1
    click element    xpath://app-sign-in-or-up-dialog/div/button/span[text()='Sign in']
    sleep    1
    page should contain element    xpath://button/span[text()='Sign out']
    log to console    Successfully logged in

Put in an order and verify
    click element    xpath://mat-card-subtitle[text()='Unusuable security is not security']/../../..//button
    click element    xpath://mat-card-title[text()='Docker Babies']/../../..//button
    page should contain element    xpath://div[@class='cartDigit'][text()='2']

Verify checkout page
    [Arguments]    ${expected_subtotal}
    click element    xpath://span[text()='Checkout']
    sleep    1
    ${actual_subtotal}=    get text    xpath://span[text()='subtotal']/../span[2]
    log to console    Subtotal: ${actual_subtotal}
    should be equal    ${expected_subtotal}    ${actual_subtotal}
    [Return]    ${actual_subtotal}