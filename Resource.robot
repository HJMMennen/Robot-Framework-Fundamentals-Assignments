*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://testautomationplayground.northeurope.cloudapp.azure.com:8080/
${browser}    Chrome
${username}    hjm
${password}    4321
${signin_el}    xpath://button/span[text()='Sign in']
${username_el}    xpath://input[@formcontrolname='username']
${password_el}    xpath://input[@formcontrolname='password']
${signin_confirm_el}    xpath://app-sign-in-or-up-dialog/div/button/span[text()='Sign in']
${signout_el}    xpath://button/span[text()='Sign out']
${order1_el}    xpath://mat-card-subtitle[text()='Unusuable security is not security']/../../..//button
${order2_el}    xpath://mat-card-title[text()='Docker Babies']/../../..//button
${order_amount_el}    xpath://div[@class='cartDigit'][text()='2']
${expected_subtotal}    €50.00
${checkout_el}    xpath://span[text()='Checkout']
${subtotal_el}    xpath://span[text()='subtotal']/../span[2]

*** Keywords ***
Open and maximize browser
    open browser    ${URL}    ${browser}
    maximize browser window

Log in to playground
    click element    ${signin_el}
    input text    ${username_el}    ${username}
    sleep    1
    input text    ${password_el}    ${password}
    sleep    1
    click element    ${signin_confirm_el}
    sleep    1
    page should contain element    ${signout_el}
    log to console    Successfully logged in

Put in an order and verify
    click element    ${order1_el}
    click element    ${order2_el}
    page should contain element    ${order_amount_el}

Verify checkout page
    [Arguments]    ${expected_subtotal}
    click element    ${checkout_el}
    sleep    1
    ${actual_subtotal}=    get text    ${subtotal_el}
    log to console    Subtotal: ${actual_subtotal}
    should be equal    ${expected_subtotal}    ${actual_subtotal}
    [Return]    ${actual_subtotal}