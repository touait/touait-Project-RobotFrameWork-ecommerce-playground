*** Settings ***
Library         SeleniumLibrary
Resource        variables.robot
Resource        keywords.robot




*** Test Cases ***
Mot de pass oublié
    Open Browser    ${UrlForgetPass}    chrome
    Title Should Be    Forgot Your Password?
    Input Text        //input[@id='input-email']   ${EMAIL}   
    Click Button      //button[normalize-space()='Continue']
    Page Should Contain    An email with a confirmation link has been sent your email address.
    







Réinitialisation du mot de passe avec email non enregistré
    Open Browser    ${UrlForgetPass}   chrome
    Title Should Be    Forgot Your Password?
    Input Text        //input[@id='input-email']    ${FauxEmail} 
    Click Button      //button[normalize-space()='Continue']
    Page Should Contain   Warning: The E-Mail Address was not found in our records, please try again!
  

Réinitialisation du mot de passe sans saisir ladresse email
    Open Browser    ${UrlForgetPass}   chrome
    Title Should Be    Forgot Your Password?
    Click Button      //button[normalize-space()='Continue']
    Page Should Contain    The E-Mail Address was not found in our records, please try again!
  