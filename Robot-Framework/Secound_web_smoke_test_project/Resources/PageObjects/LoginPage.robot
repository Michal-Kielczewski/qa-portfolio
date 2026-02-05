*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_COMPONENT}                    xpath=//*[@id="root"]/div/div[2]/div[1]
${USERNAME_FIELD}                     id=user-name
${PASSWORD_FIELD}                     id=password
${LOGIN_BUTTON}                       id=login-button
${USERNAME_LIST}                      Accepted usernames are:
${PASSWORD_LIST}                      Password for all users:
${ERROR_MASSAGE}                      xpath=//*[@id="login_button_container"]/div/form/div[3]/h3
${BLOCKED_USER_ERROR_TEXT}            Epic sadface: Sorry, this user has been locked out.
${INVALID_CREDENTIALS_ERROR_TEXT}     Epic sadface: Username and password do not match any user in this service

*** Keywords ***
Go to the "Login" page
   [Arguments]    ${LOGIN_PAGE_URL}
    Go To         ${LOGIN_PAGE_URL}

Verify "Login" page loaded
   Wait Until Page Contains Element          ${LOGIN_COMPONENT}
   Wait Until Page Contains Element          ${USERNAME_FIELD} 
   Wait Until Page Contains Element          ${PASSWORD_FIELD}  
   Wait until page contains element          ${LOGIN_BUTTON}
   Wait Until Page Contains                  ${USERNAME_LIST} 
   Wait Until Page Contains                  ${PASSWORD_LIST}    

Enter Valid Username And Password And Submit
   [Arguments]    @{VALID_CREDENTIALS} 
   Input Text    ${USERNAME_FIELD}    ${VALID_CREDENTIALS[0]}
   Input Text    ${PASSWORD_FIELD}    ${VALID_CREDENTIALS[1]}
   Click Button  ${LOGIN_BUTTON}

Enter Valid Blocked Username And Password And Submit
   [Arguments]    @{VALID_BLOCKED_USER_CREDENTIALS}
   Input Text    ${USERNAME_FIELD}    ${VALID_BLOCKED_USER_CREDENTIALS[0]}
   Input Text    ${PASSWORD_FIELD}    ${VALID_BLOCKED_USER_CREDENTIALS[1]}
   Click Button  ${LOGIN_BUTTON}

Verify "Error message for blocked user is displayed"
   Wait Until Page Contains Element     ${ERROR_MASSAGE}
   Wait Until Page Contains             ${BLOCKED_USER_ERROR_TEXT}

Enter Invalid Username And Password And Submit
   [Arguments]    @{INVALID_CREDENTIALS}
   Input Text    ${USERNAME_FIELD}    ${INVALID_CREDENTIALS[0]}
   Input Text    ${PASSWORD_FIELD}    ${INVALID_CREDENTIALS[1]}
   Click Button  ${LOGIN_BUTTON}

Verify "Error message for invalid credentials is displayed"
   Wait Until Page Contains Element     ${ERROR_MASSAGE}
   Wait Until Page Contains             ${INVALID_CREDENTIALS_ERROR_TEXT}

