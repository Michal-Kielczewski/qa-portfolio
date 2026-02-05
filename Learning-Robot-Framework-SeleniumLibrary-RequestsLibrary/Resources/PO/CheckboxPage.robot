*** Settings ***
Library              SeleniumLibrary


*** Variables *** 
${SidebarMenu}                 xpath=//*[@id="app"]/div/div/div/div[1]/div/div/div[1]
${CheckBoxSection}             xpath=//*[@id="item-1"]
${ExpandButton}                xpath=//*[@id="tree-node"]/div/button[1]
${HomeCheckBox}                xpath=//*[@id="tree-node"]/ol/li/span/label/span[1]
${DownloadCheckBox}            xpath=//*[@id="tree-node"]/ol/li/ol/li[3]/span/label
${MostBottomElementOnPage}     xpath=//*[@id="app"]/div/div/div/div[2]/div[3]
${CheckBoxOutput}              SEPARATOR=${EMPTY}
...    You have selected :
...    desktop
...    notes
...    commands
...    documents
...    workspace
...    react
...    angular
...    veu
...    office
...    public
...    private
...    classified
...    general

*** Keywords ***
Hide Ads
    Execute JavaScript    
    ...    var ads = document.querySelectorAll('iframe, [id*="ad"], [class*="ad"]');
    ...    ads.forEach(function(ad) { ad.style.display = 'none'; });

Verify "Check Box" Page Loaded
    Wait Until Page Contains           Please select an item from left to start practice.
    Wait Until Page Contains Element     ${SidebarMenu}

Click on "Check Box" section
    Click Element                    ${CheckBoxSection}
    
Verify "Check Box" section opened
    Wait Until Page Contains           Check Box

Check all checkboxes exept "Download" folder
    Click Element                    ${ExpandButton} 
    Click Element                    ${HomeCheckBox}
    Hide Ads
    Scroll Element Into View         ${MostBottomElementOnPage} 
    Sleep    1s
    Wait Until Element Is Visible    ${DownloadCheckBox}
    Click Element                    ${DownloadCheckBox}
    
Verify selected checkboxes
    Wait Until Page Contains         ${CheckBoxOutput}
    log                              ${CheckBoxOutput}




    


