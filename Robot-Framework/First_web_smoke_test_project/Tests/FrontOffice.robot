*** Settings ***
Documentation           This file contains the test cases for the front office page.
Resource                ../Resources/Common.robot
Resource                ../Resources/FrontOfficeApp.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

 # command to run the test:
 # robot -d Results Tests/FrontOffice.robot
*** Variables ***
${BROWSER}          Chrome
${HomePageURL}      https://automationplayground.com/front-office/

*** Test Cases ***
Should be able to navigate to the "Home" page
    [Documentation]    This test should open the browser with the front office page and check if the text is present.
    [Tags]    0001    Smoke    HomePage 
    FrontOfficeApp.Navigate to "Home" page

Should be able to navigate to the "Team" component on the "Home" page
    [Documentation]    This test should navigate to the "Team" section and verify its presence.
    [Tags]    0002    Smoke    HomePage
    FrontOfficeApp.Navigate to "Home" page
    FrontOfficeApp.Navigate to "Team" Component
    FrontOfficeApp.Validate "Team" Component Content

Should be able to navigate to the "Contact" component and send a message through the Contact form.
    [Documentation]    This test should navigate to the "Contact" section and send a message.
    [Tags]    0003    Smoke    HomePage
    FrontOfficeApp.Navigate to "Home" page
    FrontOfficeApp.Navigate to "Contact" Component
    FrontOfficeApp.Send a message using the Contact form

*** Keywords ***             