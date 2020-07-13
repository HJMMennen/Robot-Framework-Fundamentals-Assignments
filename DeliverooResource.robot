*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://deliveroo.nl
${browser}    Chrome
${postcode_el}    xpath://input[@id="location-search"]
${postcode}    1013GM
${search_el}    xpath://span[text()='Search']
${close_el}    xpath://span[text()='Close']

*** Keywords ***
Open and maximize browser
    open browser    ${URL}    ${browser}
    maximize browser window

Search for restaurants
    input text    ${postcode_el}    ${postcode}
    click element    ${search_el}
    sleep    2
    click element    ${close_el}
    ${restaurant_count}=    get element count    //li
    should be true    ${restaurant_count} > 0
    log to console    Number of restaurants: ${restaurant_count}