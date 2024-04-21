*** Settings ***
Library         SeleniumLibrary
Resource        variables.robot

*** Keywords ***
Open Url
    [Arguments]   ${base}
    Open Browser     ${base}    chrome 
    Maximize Browser Window
    Title Should Be  Your Store
    
     


CreationCompte 
    Open Browser    https://ecommerce-playground.lambdatest.io/index.php?route=account/register       chrome
    Maximize Browser Window
    Input Text    xpath://input[@name="firstname"]    ${firstname}
    Input Text    xpath://input[@name="lastname"]    ${lastname}
    Input Text    xpath://input[@name="email"]    ${email}
    Input Text    xpath://input[@name="telephone"]    ${telphone}
    Input Text    xpath://input[@name="password"]    ${password}
    Input Text    xpath://input[@name="confirm"]    ${password}
    Click Element   //label[@for='input-newsletter-yes']
    Click Element      //label[@for='input-agree']
    Click Element    xpath://input[@value="Continue"]

    Wait Until Page Contains    Congratulations! Your new account has been successfully created!

    



CreationCompte avec email deja utilisé
     Open Browser    https://ecommerce-playground.lambdatest.io/index.php?route=account/register       chrome
     Maximize Browser Window
    Input Text    xpath://input[@name="firstname"]    wissss
    Input Text    xpath://input[@name="lastname"]     balti
    Input Text    xpath://input[@name="email"]    ${email}
    Input Text    xpath://input[@name="telephone"]    587489653
    Input Text    xpath://input[@name="password"]    ${password}
    Input Text    xpath://input[@name="confirm"]    ${password}
    Click Element   //label[@for='input-newsletter-yes']
    Click Element      //label[@for='input-agree']
    Click Element    xpath://input[@value="Continue"]

    Wait Until Page Contains    Warning: E-Mail Address is already registered!
      Close Browser



Création de compte sans remplir le champs téléphone
     Open Browser    https://ecommerce-playground.lambdatest.io/index.php?route=account/register       chrome
     Maximize Browser Window

    Input Text    xpath://input[@name="firstname"]    ${firstname}
    Input Text    xpath://input[@name="lastname"]    ${lastname}
    Input Text    xpath://input[@name="email"]    ${email}
    Input Text    xpath://input[@name="password"]    ${password}
    Input Text    xpath://input[@name="confirm"]    ${password}
    Click Element   //label[@for='input-newsletter-yes']
    Click Element      //label[@for='input-agree']
    Click Element    xpath://input[@value="Continue"]

    Wait Until Page Contains    Telephone must be between 3 and 32 characters!

     Close Browser








Login valide
   [Arguments]   ${u}    ${p}
   Click Element     My account
   Input Text  css=input[name="email"]  ${u}
    Input Password  css=input[name="password"]   ${p}
    Click Button  css=input[value="Login"]
    
