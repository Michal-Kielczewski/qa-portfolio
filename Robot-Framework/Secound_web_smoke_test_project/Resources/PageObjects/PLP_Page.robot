*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections


*** Variables ***    
${INVENTORY_CONTAINER}                id=inventory_container
${ALL_PLP_ITEMS}                      css=.inventory_item
${PRODUCT_PRICE}                      css=.inventory_item_price
${SORTING_DROPDOWN_LIST}              class=product_sort_container
${SORTING_OPTION_PRICE_HIGH_TO_LOW}   hilo
${PRODUCT_"Sauce Labs Backpack"}      id=item_4_title_link


*** Keywords ***

Verify "PLP" page is loaded
   Wait Until Page Contains Element       ${INVENTORY_CONTAINER}
   Wait Until Page Contains               Products
   # Verify that the number of products displayed is equal to 6
   ${elements}=    Get WebElements        ${ALL_PLP_ITEMS} 
   Length Should Be    ${elements}        6


Click "Sort" dropdown and select "Price (high to low)"
   Wait Until Page Contains Element       ${SORTING_DROPDOWN_LIST}
   Click Element                          ${SORTING_DROPDOWN_LIST}  
   Select From List By Value              ${SORTING_DROPDOWN_LIST}      ${SORTING_OPTION_PRICE_HIGH_TO_LOW}


Verify that the products are sorted by price (high to low)
    Wait Until Page Contains Element         ${ALL_PLP_ITEMS} 
    @{PRICE_ELEMENTS}=    Get WebElements    ${PRODUCT_PRICE}   
    @{PRICES}=    Create List
    
    FOR    ${element}    IN    @{PRICE_ELEMENTS}
        ${price_text}=    Get Text    ${element}
        ${price_without_dollar}=    Replace String    ${price_text}    $    ${EMPTY}
        ${price_number}=    Convert To Number    ${price_without_dollar}
        Append To List    ${PRICES}    ${price_number}
    END
    ${sorted_prices}=    Copy List    ${PRICES}
    Sort List    ${sorted_prices}
    Reverse List    ${sorted_prices}
    Lists Should Be Equal    ${PRICES}    ${sorted_prices}    Products are sorted from high to low by price!
    

Open "Sauce Labs Backpack" PDP
    Wait Until Page Contains Element        ${ALL_PLP_ITEMS}
    Click Element                           ${PRODUCT_"Sauce Labs Backpack"} 
    

Add first product to cart
    Wait Until Page Contains Element        ${ALL_PLP_ITEMS}
    Click Button                            xpath=//*[@id="add-to-cart-sauce-labs-bike-light"]


    