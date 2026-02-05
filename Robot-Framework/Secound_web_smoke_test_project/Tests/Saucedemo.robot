*** Settings ***
Documentation           This file contains the test cases for the Saucedemo website.
Resource                ../Resources/Common.robot
Resource                ../Resources/SaucedemoApp.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

# command to run the test:
 # robot -d Results Tests/saucedemo.robot
*** Variables ***
${BROWSER}                             Chrome
${LOGIN_PAGE_URL}                      https://www.saucedemo.com/ 
@{VALID_CREDENTIALS}                   standard_user    secret_sauce
@{VALID_BLOCKED_USER_CREDENTIALS}      locked_out_user    secret_sauce
@{INVALID_CREDENTIALS}                 invalid_user    invalid_password
@{CUSTOMER_INFO}                       John    Doe    12345
***test cases***

Should be able to navigate to the "login" page
    [Documentation]     Test verifies that the user can navigate to the "Login" page.
    [Tags]    0001    Smoke    LoginPage
    SaucedemoApp.Navigate to "Login" page

Logging in with correct credentials
    [Documentation]     Test verifies that logging in with valid credentials redirects user to Product Listing Page, and logout option is available after login.
    [Tags]    0002    Smoke    LoginPage
    SaucedemoApp.Navigate to "Login" page
    SaucedemoApp.Login with valid credentials   @{VALID_CREDENTIALS}
    SaucedemoApp.Logout user

Logging in with a blocked user credentials
    [Documentation]     Test verifies that logging in with a blocked user credentials displays an error message.
    [Tags]    0003    Smoke    LoginPage
    SaucedemoApp.Navigate to "Login" page
    SaucedemoApp.Login with valid blocked user credentials   @{VALID_BLOCKED_USER_CREDENTIALS}

Logging in with incorrect credentials
    [Documentation]     Test verifies that logging in with incorrect credentials displays an error message.
    [Tags]    0004    Smoke    LoginPage
    SaucedemoApp.Navigate to "Login" page
    SaucedemoApp.Login with invalid credentials    @{INVALID_CREDENTIALS}

Should be able to navigate to the PLP page
    [Documentation]    Test verifies that the user can navigate to the Product Listing Page after successful login.
    [Tags]    0005    Smoke    PLP_Page
    SaucedemoApp.Navigate to "Login" page
    SaucedemoApp.Login with valid credentials   @{VALID_CREDENTIALS}

Verification of sorting functionality in the product listing page
    [Documentation]     Test verifies that sorting functionality works correctly on the Product Listing Page.
    [Tags]    0006    Smoke    PLP_Page    
    SaucedemoApp.Navigate to "Login" page
    SaucedemoApp.Login with valid credentials   @{VALID_CREDENTIALS}
    SaucedemoApp.Check sorting functionality
    SaucedemoApp.Logout user

Should be able to navigate to the PDP page
    [Documentation]   Test verifies that the user can navigate to the Product Details Page by clicking on a product from the Product Listing Page.
    [Tags]    0007    Smoke    PDP_Page
    SaucedemoApp.Navigate to "Login" page
    SaucedemoApp.Login with valid credentials   @{VALID_CREDENTIALS}
    SaucedemoApp.Navigate to the PDP by clicking on a product from the PLP   

The user should be able to add product to cart from PDP
    [Documentation]    Test verifies that adding a product "Sauce Labs Backpack" from the Product Details Page is working and the cart icon counter increases.
    [Tags]    0008    Smoke    PDP_Page    
    SaucedemoApp.Navigate to "Login" page
    SaucedemoApp.Login with valid credentials   @{VALID_CREDENTIALS}
    SaucedemoApp.Navigate to the PDP by clicking on a product from the PLP
    SaucedemoApp.Adding product to cart from PDP
    SaucedemoApp.Logout user

Should be able to navigate to the Shopping Cart page
    [Documentation]   Test verifies that clicking on the cart icon redirects the user to the Shopping Cart page (cart.html).
    [Tags]    0009    Smoke    Checkout
    SaucedemoApp.Navigate to "Login" page
    SaucedemoApp.Login with valid credentials   @{VALID_CREDENTIALS}
    SaucedemoApp.Adding product to cart from PLP
    SaucedemoApp.Navigate to the Shopping Cart page

The user should be able to complete the transaction
    [Documentation]    Test verifies that clicking "Checkout" in the cart redirects the user to the information form page (checkout-step-one.html).
    [Tags]    0010    Smoke    Checkout
    SaucedemoApp.Navigate to "Login" page
    SaucedemoApp.Login with valid credentials   @{VALID_CREDENTIALS}
    SaucedemoApp.Navigate to the PDP by clicking on a product from the PLP
    SaucedemoApp.Adding product to cart from PDP
    SaucedemoApp.Navigate to the Shopping Cart page
    SaucedemoApp.Finalizing purchase    @{CUSTOMER_INFO}
    

# Viewing cart contents
#     [Documentation]    Test verifies that after adding at least one product, clicking on the cart icon displays all added products with their prices.

# Removing product from cart
#     [Documentation]    Test verifies that removing a product from the cart updates the product list and decrements the cart icon counter accordingly.

# Entering personal information in checkout
#     [Documentation]    Test verifies that filling in personal details (First Name, Last Name, Postal Code) in the checkout form and clicking "Continue" redirects the user to the order overview page.

# Viewing order summary
#     [Documentation]    Test verifies that the order summary page displays the correct products, tax calculation, total amount, and payment and shipping information.

# Finalizing purchase
#     [Documentation]    Test verifies that clicking "Finish" on the order summary page completes the purchase and displays the confirmation message "Thank you for your order!".

# Using hamburger menu and logging out
#     [Documentation]    Test verifies that clicking the hamburger menu icon displays available menu options and that selecting "Logout" successfully logs the user out.

# Returning to product listing
#     [Documentation]    Test verifies that clicking "Continue Shopping" or the site logo from any subpage redirects the user to the Product Listing Page (inventory.html).




*** Keywords ***