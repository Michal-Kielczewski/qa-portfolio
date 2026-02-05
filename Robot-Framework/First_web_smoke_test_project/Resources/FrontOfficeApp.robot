*** Settings ***
Resource            ../Resources/PO/HomePage.robot
Resource            ../Resources/PO/TopNav.robot


*** Keywords ***
Navigate to "Home" page
    HomePage.Go to the "Home" page    ${HomePageURL}
    HomePage.Verify "Home" Page Loaded


Navigate to "Team" Component
    TopNav.Select "Team" CTA
    HomePage.Verify "Team" Component Loaded

Validate "Team" Component Content
    HomePage.Validate "Team" Component H2 text

Navigate to "Contact" Component
    TopNav.Select "Contact" CTA
    HomePage.Verify "Contact" Component Loaded

Send a message using the Contact form
    HomePage.Send Message by Contact Form
    HomePage.Verify Contact Form Submission
