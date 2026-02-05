*** Settings ***
Library    SeleniumLibrary
Resource       ../PageObjects/PLP_Page.robot

*** Variables ***
${FIRST_NAME_FIELD}            xpath=//*[@id="first-name"]
${LAST_NAME_FIELD}             id=last-name
${POSTAL_CODE_FIELD}           id=postal-code
${BT_CONTINUE}                 xpath=//*[@id="continue"]

*** Keywords ***
Verify "Checkout Step One" page is loaded
    Wait Until Page Contains Element     ${BT_CONTINUE}    
    Wait Until Page Contains Element     ${FIRST_NAME_FIELD} 
    Wait Until Page Contains Element     ${LAST_NAME_FIELD}  
    Wait Until Page Contains Element     ${POSTAL_CODE_FIELD}
    Wait Until Page Contains             Checkout: Your Information

Fill in the checkout information form and continue
    [Arguments]    @{CUSTOMER_INFO}
    Input Text     ${FIRST_NAME_FIELD}    ${CUSTOMER_INFO[0]}
    Input Text     ${LAST_NAME_FIELD}     ${CUSTOMER_INFO[1]}
    Input Text     ${POSTAL_CODE_FIELD}   ${CUSTOMER_INFO[2]}
    Click Button   ${BT_CONTINUE}

Complete "checkout-step-two"
    Wait Until Page Contains       Payment Information:
    Wait Until Page Contains       Shipping Information:
    Wait Until Page Contains       Price Total
    Click Button                   id=finish

Verify "checkout-complete" page is loaded
    Wait Until Page Contains        Thank you for your order!
    Wait Until Page Contains        Your order has been dispatched, and will arrive just as fast as the pony can get there!

Click "back to products" and verify redirection to PLP    
    Click Button                    id=back-to-products
    PLP_Page.Verify "PLP" page is loaded 