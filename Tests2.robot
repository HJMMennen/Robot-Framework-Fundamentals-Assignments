*** Settings ***
Library    SeleniumLibrary
Resource    Resource.robot
Suite Setup    Open and maximize browser
Suite Teardown    close browser

*** Variables ***

*** Test Cases ***
Assignment One
    [Tags]    Shopping basket    Playground
    Put in an order and verify

Assignment Two
    [Tags]    Login    Playground
    Log in to playground

Assignment Three
    [Tags]    Checkout    Playground
    Verify checkout page   ${expected_subtotal}