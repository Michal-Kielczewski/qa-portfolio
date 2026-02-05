*** Settings ***
Documentation           This file contains the test cases for the https://demoqa.com/ page.
Resource                ../Resources/Common.robot
Resource                ../Resources/demoqa.comApp.robot
Test Setup              Begin Web Test
Test Teardown           End Web Test

 # command to run the test:
 # robot -d Results Tests/demoqa.com.robot
*** Variables ***
${BROWSER}          Chrome
${HomePageURL}      https://demoqa.com/

*** Test Cases ***
Should be able to navigate to the "Home" page
    [Documentation]    This test should open the browser with the demoqa page.
    [Tags]    0001    Smoke    HomePage 
    demoqa.comApp.Navigate to "Home" page

First exercise in "Elements"
    [Documentation]    This test should navigate to the "Text Box" component and validate its content.
    [Tags]    0002     Exercise    
    demoqa.comApp.Navigate to "Home" page
    demoqa.comApp.Navigate to demoqa.com/elements page
    demoqa.comApp.Open "Text Box" section and fill "Text Box" form and submit

Secound exercise in "Elements"
    [Documentation]    This test should navigate to the "Check Box" component and validate its content.
    [Tags]    0003     Exercise    current
    demoqa.comApp.Navigate to "Home" page
    demoqa.comApp.Navigate to demoqa.com/elements page
    demoqa.comApp.Open "Check Box" section and check all checkboxes exept "Download" folder


*** Keywords ***              