*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FIRST_NAME_FIELD}            xpath=//*[@id="first-name"]
${LAST_NAME_FIELD}             id=last-name
${POSTAL_CODE_FIELD}           id=postal-code
${BT_CONTINUE}                 xpath=//*[@id="continue"]

*** Keywords ***

Click "Checkout" CTA in the Shopping Cart
    Wait Until Page Contains Element    xpath=//*[@id="checkout"]
    Click Button                        xpath=//*[@id="checkout"]

Verify "Checkout Step One" page is loaded
    Wait Until Page Contains Element     ${BT_CONTINUE}    
    Wait Until Page Contains Element     ${FIRST_NAME_FIELD} 
    Wait Until Page Contains Element     ${LAST_NAME_FIELD}  
    Wait Until Page Contains Element     ${POSTAL_CODE_FIELD}
    Wait Until Page Contains             Checkout: Your Information

Fill in the checkout information form and continue
    [Arguments]    ${first_name}=John    ${last_name}=Doe    ${postal_code}=12345
    Input Text     ${FIRST_NAME_FIELD}    ${first_name}
    Input Text     ${LAST_NAME_FIELD}     ${last_name}
    Input Text     ${POSTAL_CODE_FIELD}   ${postal_code}
    Click Button   ${BT_CONTINUE}

Verify "Shopping Cart" page is loaded
    Wait Until Page Contains Element     xpath=//*[@id="cart_contents_container"]/div/div[2]
    Wait Until Page Contains             Your Cart
    