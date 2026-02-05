*** Settings ***
Resource       ../Resources/PageObjects/LoginPage.robot
Resource       ../Resources/PageObjects/PLP_Page.robot
Resource       ../Resources/PageObjects/NavBar.robot
Resource       ../Resources/PageObjects/PDP_Page.robot
Resource       ../Resources/PageObjects/Cart.robot
Resource       ../Resources/PageObjects/Checkout.robot

*** Variables ***
${LOGIN_PAGE_URL}
@{VALID_CREDENTIALS}
@{CUSTOMER_INFO}

*** Keywords ***
Navigate to "Login" page
    LoginPage.Go to the "Login" page   ${LOGIN_PAGE_URL}
    LoginPage.Verify "Login" page loaded

Login with valid credentials
    [Arguments]    @{VALID_CREDENTIALS}
    LoginPage.Enter Valid Username And Password And Submit    @{VALID_CREDENTIALS}
    PLP_Page.Verify "PLP" page is loaded

Logout user
    NavBar.Click "Logout" CTA in the NavBar 
    LoginPage.Verify "Login" page loaded
 
Login with valid blocked user credentials
    [Arguments]    @{VALID_BLOCKED_USER_CREDENTIALS}
    LoginPage.Enter Valid Blocked Username And Password And Submit    @{VALID_BLOCKED_USER_CREDENTIALS}
    LoginPage.Verify "Error message for blocked user is displayed"


Login with invalid credentials
    [Arguments]    @{INVALID_CREDENTIALS}
    LoginPage.Enter Invalid Username And Password And Submit    @{INVALID_CREDENTIALS}
    LoginPage.Verify "Error message for invalid credentials is displayed"

Check sorting functionality
    PLP_Page.Click "Sort" dropdown and select "Price (high to low)"
    PLP_Page.Verify that the products are sorted by price (high to low)

Navigate to the PDP by clicking on a product from the PLP
    PLP_Page.Open "Sauce Labs Backpack" PDP
    PDP_Page.Verify product details content is correct for product "Sauce Labs Backpack"

Adding product to cart from PDP
    PDP_Page.Click "Add to cart" button

Navigate to the Shopping Cart page
    NavBar.Click "Shopping Cart" icon
    Cart.Verify "Shopping Cart" page is loaded

Finalizing purchase
    [Arguments]   @{CUSTOMER_INFO}
    Cart.Click "Checkout" CTA in the Shopping Cart
    Checkout.Verify "Checkout Step One" page is loaded
    Checkout.Fill in the checkout information form and continue    @{CUSTOMER_INFO}
    Checkout.Complete "checkout-step-two"
    Checkout.Verify "checkout-complete" page is loaded
    Checkout.Click "back to products" and verify redirection to PLP

Adding product to cart from PLP
    PLP_Page.Add first product to cart
    NavBar.Verify cart icon counter is updated to 1 after adding a product to cart from PLP