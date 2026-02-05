*** Settings ***
Library              SeleniumLibrary

*** Variables ***
${HomePageURL}  
${ToolsQaImage}                  xpath=//*[@id="app"]/header/a/img
${Category"Elements"}            xpath=//*[@id="app"]/div/div/div[2]/div/div[1]
${Category"Check Box"}           xpath=//*[@id="item-1"]/span

*** Keywords ***
Go to the "Home" page
   [Arguments]    ${HomePageURL}
    Go To    ${HomePageURL}

Verify "Home" Page Loaded
    Element Should Be Visible      ${ToolsQaImage}

navigate to the "Elements" page
    Click Element    ${Category"Elements"} 

    


