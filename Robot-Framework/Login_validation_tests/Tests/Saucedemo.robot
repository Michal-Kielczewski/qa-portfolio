*** Settings ***
Documentation           This file contains the test cases for the Saucedemo website.
Resource                ../Resources/Common.robot
Resource                ../Resources/SaucedemoApp.robot
#Resource                ../Data/InputData.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

# command to run the test:
 # robot -d Results Tests/saucedemo.robot
*** Variables ***
${ENVIRONMENT}                         prod
${BROWSER}                             Chrome
&{LOGIN_PAGE_URL}                      prod=https://www.saucedemo.com/    qa=https://www.qa.saucedemo.com/

#input data for test cases
@{CUSTOMER_INFO}                       John    Doe    12345
@{VALID_CREDENTIALS}                   standard_user    secret_sauce
&{VALID_BLOCKED_USER_CREDENTIALS}          Username=locked_out_user     Password=secret_sauce        ExpectedErrorMessage=Epic sadface: Sorry, this user has been locked out.
&{INVALID_CREDENTIALS}                     Username=invalid_user        Password=invalid_password    ExpectedErrorMessage=Epic sadface: Username and password do not match any user in this service
&{INVALID_CREDENTIALS_NO_PASSWORD}         Username=standard_user       Password=#BLANK              ExpectedErrorMessage=Epic sadface: Password is required
&{INVALID_CREDENTIALS_NO_USERNAME}         Username=#BLANK              Password=secret_sauce        ExpectedErrorMessage=Epic sadface: Username is required
&{INVALID_CREDENTIALS_INCORRECT_PASSWORD}  Username=standard_user       Password=wrong_password      ExpectedErrorMessage=Epic sadface: Username and password do not match any user in this service


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
    
Multiple invalid login sceenarios should display correct error messages
    [Documentation]     Test verifies that logging in with invalid credentials displays correct error messages.
    [Tags]    0003    Regression    LoginPage
    [Template]  Test Multiple Login Scenarios
    ${VALID_BLOCKED_USER_CREDENTIALS}
    ${INVALID_CREDENTIALS}
    ${INVALID_CREDENTIALS_NO_PASSWORD}
    ${INVALID_CREDENTIALS_NO_USERNAME} 
    ${INVALID_CREDENTIALS_INCORRECT_PASSWORD}



*** Keywords ***