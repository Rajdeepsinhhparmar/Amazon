*** Settings ***
Library  AppiumLibrary
Resource  ../Locators/Amazon_locators.robot

*** Keywords ***
Open App
   open application   http://localhost:4723/wd/hub
    ...  platformName=Android
    ...  platformVersion=12
    ...  deviceName=92MAY02E8L
    ...  appPackage=in.amazon.mShop.android.shopping
    ...  appActivity=com.amazon.mShop.splashscreen.StartupActivity
    ...  automationName=uiautomator2

    sleep  10s

Choose Language and Skip Sign In
     wait until element is visible  ${English_button}  5s
     click element  ${English_button}
     run keyword and return status  Allow
     wait until element is visible  ${Continue_in_English_Button}   120s
     click element  ${Continue_in_English_Button}
     wait until element is visible   ${skip_sign_in}
     click element  ${skip_sign_in}

Validate home page components
    wait until element is visible  ${Validate_Home_Page}

Search Watch and navigate to forth watch result after enable prime
    click element  ${SEARCH_BUTTON}
    wait until element is visible  ${SEARCH_Bar}  5s
    input text  ${SEARCH_Bar}  Watch
    sleep    2s
    wait until element is visible   ${SEARCH_Bar}
    click element  ${SEARCH_Bar}
    sleep  2S
    wait until element is visible    ${Search_Text5}
    click element  ${Search_Text5}
    sleep  2s
    Click text  ${Tap_Prime_toggle}

    FOR  ${temp}    IN RANGE      60
           ${Status}  Run Keyword And Return Status   page should contain element    ${4th_item}
           Run Keyword If   ${Status} == False    swipe    800     1500     400    1000   2000
           ...    ELSE    Exit For Loop
           sleep    2s
    END

    click element   ${4th_item}

Add product to card and verify added items
    FOR    ${temp}    IN RANGE      60
             ${Status}  Run Keyword And Return Status   page should contain text    ${BuyNow}
             Run Keyword If   ${Status} == False    swipe    800     1500     400    1000   2000
             ...    ELSE    Exit For Loop
             sleep    2s
    END

    click text  ${Addtocart_Button}

    sleep  5S
    ${status}   Run Keyword And Return Status   page should contain text    ${done_text}
    run keyword if  ${status} == True  click text  ${done_text}
    click element   ${cart_Button}
    sleep  2s
    wait until element is visible  ${cart_validation}    10s

Remove items from cart
    sleep  2S
    click element  ${remove_button}

Navigate to Settings -> Legal & About -> Legal Information -> Conditions of Use
    click element at coordinates   977  2022
    sleep  2s
    FOR    ${temp}    IN RANGE      60
               ${Status}  Run Keyword And Return Status   page should contain element    ${settings_button}
               Run Keyword If   ${Status} == False    swipe    800     1500     400    1000   2000
               ...    ELSE    Exit For Loop
             sleep    2s
    END

    click element at coordinates   185  1155

   FOR    ${temp}    IN RANGE      60
              ${Status}  Run Keyword And Return Status   page should contain element    ${legal&about_button}
              Run Keyword If   ${Status} == False    swipe    800     1500     400    1000   2000
              ...    ELSE    Exit For Loop
              sleep    2s
             CLICK ELEMENT  ${legal&about_button}
   END
   sleep  2s
   click element  ${legal_information_button}
   sleep  2s
   click element  ${condition_of_use_button}

   FOR    ${temp}    IN RANGE      60
                 ${Status}  Run Keyword And Return Status   page should contain element    ${yes_button}
                 Run Keyword If   ${Status} == False    swipe    800     1500     400    1000   2000
                 ...    ELSE    Exit For Loop
                 sleep    2s
   click element  ${yes_button}


Navigate to Home Page
    sleep  2s
    click element  ${home_button}
    sleep  2s
    quit application


*** Variables ***
@{Search_Bar_Text}  Watch  Jeans