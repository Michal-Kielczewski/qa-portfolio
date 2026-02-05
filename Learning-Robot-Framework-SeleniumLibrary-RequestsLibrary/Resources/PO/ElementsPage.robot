*** Settings ***
Library              SeleniumLibrary


*** Variables ***
${SidebarMenu}            xpath=//*[@id="app"]/div/div/div/div[1]/div/div/div[1]
${TextBoxSection}         xpath=//*[@id="item-0"]
${TextBoxOutput}          xpath=//*[@id="output"]/div

*** Keywords ***
Verify "Elements" Page Loaded
    Wait Until Page Contains           Please select an item from left to start practice.
    Wait Until Page Contains Element     ${SidebarMenu}

Click on "Text Box" section
    Click Element            ${TextBoxSection}
    
Verify "Text Box" section opened
    Wait Until Page Contains           Text Box

Verify "Text Box" form submission
    Wait Until Page Contains Element           ${TextBoxOutput}

Fill "Text Box" form and submit
    Input Text    xpath=//*[@id="userName"]             John
    Input Text    xpath=//*[@id="userEmail"]            john@example.com
    Input Text    xpath=//*[@id="currentAddress"]       123 Main St, Anytown, USA
    Input Text    xpath=//*[@id="permanentAddress"]     456 Elm St, Othertown, USA
    Wait Until Keyword Succeeds    5s    1s    Click Element    id=submit    action_chain=True #scroll down to the button and click CTA 5 times 
    


