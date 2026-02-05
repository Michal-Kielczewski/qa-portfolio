*** Settings ***
Resource       ../Resources/PageObjects/LoginPage.robot
Resource       ../Resources/PageObjects/PLP_Page.robot
Resource       ../Resources/PageObjects/NavBar.robot

*** Variables ***


*** Keywords ***
Test Multiple Login Scenarios
    [Arguments]        ${Credentials}
    Navigate to "Login" page    
    LoginPage.Enter Credenials    ${Credentials}
    LoginPage.Verify "Error message" is displayed  ${Credentials}
    
Navigate to "Login" page
    LoginPage.Go to the "Login" page  
    LoginPage.Verify "Login" page loaded

Login with valid credentials
    [Arguments]    @{VALID_CREDENTIALS}
    LoginPage.Enter Valid Username And Password And Submit    @{VALID_CREDENTIALS}
    PLP_Page.Verify "PLP" page is loaded

Logout user
    NavBar.Click "Logout" CTA in the NavBar 
    LoginPage.Verify "Login" page loaded

