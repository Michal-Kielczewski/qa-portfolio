*** Settings ***
Resource            ../Resources/PO/HomePage.robot
Resource            ../Resources/PO/ElementsPage.robot
Resource            ../Resources/PO/CheckboxPage.robot

*** Keywords ***
Navigate to "Home" page
    HomePage.Go to the "Home" page    ${HomePageURL}
    HomePage.Verify "Home" Page Loaded

Navigate to demoqa.com/elements page
    HomePage.navigate to the "Elements" page
    ElementsPage.Verify "Elements" Page Loaded

Open "Text Box" section and fill "Text Box" form and submit
    ElementsPage.Click on "Text Box" section
    ElementsPage.Verify "Text Box" section opened
    ElementsPage.Fill "Text Box" form and submit
    ElementsPage.Verify "Text Box" form submission

Open "Check Box" section and check all checkboxes exept "Download" folder
    CheckboxPage.Click on "Check Box" section
    CheckboxPage.Verify "Check Box" section opened
    CheckboxPage.Check all checkboxes exept "Download" folder
    CheckboxPage.Verify selected checkboxes
