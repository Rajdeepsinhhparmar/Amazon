*** Settings ***
Library  AppiumLibrary
Resource  ../Keywords/Amazon_Keywords.robot


*** Test Cases ***

TC : 01 || Open Application
    open app

TC : 02 || Choose your language and Skip Sign-in
    Choose Language and Skip Sign In

TC : 03 || Validate the Home page components
    Validate home page components

TC : 04 || Search Watch and navigate to forth watch result after enable prime
    Search Watch and navigate to forth watch result after enable prime

TC : 05 || Add product to card and verify added items
    Add product to card and verify added items

TC : 06 || Remove the recently added product from the Cart
    Remove items from cart

TC : 07 || Navigate to Settings -> Legal & About -> Legal Information -> Conditions of Use
    Navigate to Settings -> Legal & About -> Legal Information -> Conditions of Use

TC : 08 || Navigate to Home Page
    Navigate to Home Page