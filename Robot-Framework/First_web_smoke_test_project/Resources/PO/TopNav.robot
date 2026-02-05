*** Settings ***
Library              SeleniumLibrary

*** Variables ***
${TopNav"Team"CTA}            xpath=//*[@id="bs-example-navbar-collapse-1"]/ul/li[5]/a
${TopNav"Contact"CTA}         xpath=//*[@id="bs-example-navbar-collapse-1"]/ul/li[6]/a

*** Keywords ***
Select "Team" CTA
    Click Element                 ${TopNav"Team"CTA}

Select "Contact" CTA
    Click Element                 ${TopNav"Contact"CTA} 
