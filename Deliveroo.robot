*** Settings ***
Library    SeleniumLibrary
Resource    DeliverooResource.robot
Test Setup    Open and maximize browser
Test Teardown    close browser

*** Variables ***

*** Test Cases ***
Test
    Search for restaurants