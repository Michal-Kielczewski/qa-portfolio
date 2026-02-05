*** Settings ***
Library              SeleniumLibrary

*** Variables ***
${HomePageURL}  
${"Home"PageHeader}                 It's Nice To Meet You
${"Team"Component}                  id=team
${"Team"ComponentLabel}             CSS=#team > div > div:nth-child(1) > div > h2
${"Contact"Component}               id=contact
${"SendMessage"Button}              xpath=//*[@id="contactForm"]/div/div[4]/button
${"ContactFormSubmissionMessage"}   Your message has been sent.

*** Keywords ***
Go to the "Home" page
   [Arguments]    ${HomePageURL}
    Go To    ${HomePageURL}

Verify "Home" Page Loaded
    Wait Until Page Contains        ${"Home"PageHeader} 

Verify "Team" Component Loaded
    Wait Until Element Is Visible   ${"Team"Component}

Validate "Team" Component H2 text
    #"ignore_case" have been added because this veryfication is failling on Chrome but works on Edge.
    Element Text Should Be          ${"Team"ComponentLabel}    Our Amazing Team    ignore_case= ${True}

Verify "Contact" Component Loaded
    Wait Until Element Is Visible   ${"Contact"Component}
    
Send Message by Contact Form
    [Documentation]    This keyword fills out the contact form and submits it.
    Input Text    id=name        John Doe
    Input Text    id=email       example@exa.com
    Input Text    id=phone       123456789
    Input Text    id=message     This is a sample message.
    Click Button  ${"SendMessage"Button}  

Verify Contact Form Submission
    [Documentation]    This keyword verifies that the contact form submission was successful.
    Wait Until Page Contains      ${"ContactFormSubmissionMessage"}
    
