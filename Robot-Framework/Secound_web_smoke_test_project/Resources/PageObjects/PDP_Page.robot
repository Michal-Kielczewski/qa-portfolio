*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${PRODUCT_"Sauce Labs Backpack_TEXT"}              Sauce Labs Backpack
${PRODUCT_"Sauce Labs Backpack"_DESCRIPTION}       carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
${"Add to cart"_BUTTON}                            id= add-to-cart
${"REMOVE"_FROM_CART_BUTTON}                       id=remove
${SHOPPING_CART_ICON}                              css=.shopping_cart_link

*** Keywords ***
Verify product details content is correct for product "Sauce Labs Backpack"
    Wait Until Page Contains                     ${PRODUCT_"Sauce Labs Backpack_TEXT"} 
    Wait Until Page Contains                     ${PRODUCT_"Sauce Labs Backpack"_DESCRIPTION}

Click "Add to cart" button
    Wait Until Page Contains Element        ${"Add to cart"_BUTTON} 
    Click Button                            ${"Add to cart"_BUTTON} 
    Page Should Contain Button              ${"REMOVE"_FROM_CART_BUTTON}
    Wait Until Element Contains             ${SHOPPING_CART_ICON}     1
