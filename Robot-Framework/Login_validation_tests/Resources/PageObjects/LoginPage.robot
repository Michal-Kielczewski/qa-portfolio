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
${ENVIRONMENT}                        

    
*** Keywords ***
Go to the "Login" page
    Go To    ${LOGIN_PAGE_URL.${ENVIRONMENT}}
   # ${SigninURL} = Catenate    SEPARATOR=/    ${LOGIN_PAGE_URL.${ENVIRONMENT}}   ${LOGIN_URL}
   # Go To    ${SigninURL}

Enter Credenials
   [Arguments]    ${Credentials}
   Run Keyword If    "${Credentials.Username}" != "#BLANK"     Input Text    ${USERNAME_FIELD}    ${Credentials.Username}
   #Run Keyword unless   "${Credentials.Username}" == "#BLANK"   ${USERNAME_FIELD}    ${Credentials.Username}
   Run Keyword If    "${Credentials.Password}" != "#BLANK"    Input Text    ${PASSWORD_FIELD}    ${Credentials.Password}
   Click Button  ${LOGIN_BUTTON}

Verify "Error message" is displayed
   [Arguments]    ${Credentials}
   Wait Until Page Contains Element     ${ERROR_MASSAGE}
   Wait Until Page Contains             ${Credentials.ExpectedErrorMessage}

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


