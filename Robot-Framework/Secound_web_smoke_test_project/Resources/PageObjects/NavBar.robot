*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HAMBURGER_ICON}                id=react-burger-menu-btn
${HAMBURGER_MENU_DISPLAYED}      xpath=//*[@id="menu_button_container"]/div/div[2]/div[1]/nav
${LOGOUT_CTA}                    xpath=//*[@id="logout_sidebar_link"]

*** Keywords ***
Click "Logout" CTA in the NavBar
    Wait Until Page Contains Element    ${HAMBURGER_ICON}
    Click Button                        ${HAMBURGER_ICON}
    Wait Until Element Is Visible       ${HAMBURGER_MENU_DISPLAYED}
    Click Element                       ${LOGOUT_CTA}  

Click "Shopping Cart" icon
    Wait Until Page Contains Element    xpath=//*[@id="shopping_cart_container"]/a
    Click Element                       xpath=//*[@id="shopping_cart_container"]/a

Verify cart icon counter is updated to 1 after adding a product to cart from PLP
    Wait Until Page Contains Element        xpath=//*[@id="shopping_cart_container"]/a/span
    Element Text Should Be                  xpath=//*[@id="shopping_cart_container"]/a/span    1

