*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}           chrome
${CHROME_ARGS}       --disable-save-password-bubble    --disable-features=PasswordLeakDetection    --disable-features=PasswordManagerLeakDetection

*** Keywords ***
Open Chrome With Disabled Password Manager
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    
    ${prefs}=    Create Dictionary    
    ...    credentials_enable_service=${FALSE}
    ...    profile.password_manager_enabled=${FALSE}
    ...    profile.password_manager_leak_detection=${FALSE}
    Call Method    ${chrome_options}    add_experimental_option    prefs    ${prefs}
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Create Webdriver    Chrome    options=${chrome_options}

Begin Web Test
    Open Chrome With Disabled Password Manager
    Maximize Browser Window

End Web Test
    Close All Browsers


