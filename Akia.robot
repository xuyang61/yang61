# Test suite is to test the International invoicing reference code generator (Kansainvälinen viitenumero)
# system on Akia banking page
# Test suites ultilize external library Browser, Collections.
# Tests include input value check, output value check, format check and print format check


*** Settings ***
Library             Browser
Library             check_RF_number.py
Suite Setup         Setup Test Suite    headless=true
Suite Teardown      Close Browser
Test Setup          New Page            https://www.aktia.fi/fi/yritysasiakkaat/viitenumerolaskuri
Test Teardown       Close Context
# to run the test use: robot /path/User_Login.robot

*** Variables ***
${VALID} =  ""
${REF} = ""
${user_input}=${EMPTY}

*** Test Cases ***
1. All result includes "RF" as initial, return same amount as chosen reference amount
    click           text = Hyväksy kaikki evästeet
     # choose international reference function
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  value  10
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     123
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count               text=/.*RF.*/     ==      10

2. The customer initial numbers should be less then 20 digits
    click           text = Hyväksy kaikki evästeet
      # choose international reference function
    Click           //*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       10
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     123456789012345678901
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count       text=/.Kenttä ei saa olla pidempi kuin 19 merkkiä./     ==      1

3. The customer initial should be numeric only
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     11e1
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count      text=/.Kenttä on pakollinen./     ==      1

4. The customer initial should be numeric only
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     111e
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count      text=/.Kenttä on pakollinen./     ==      1

5.The customer initial should be numeric only
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     e111
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count      text=/.Kenttä on pakollinen./     ==      1

6. The customer initial should be numeric only
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     111E
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count   text=/.Kenttä on pakollinen./     ==      1.0

7. The customer initial should be numeric only
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     E111
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count   text=/.Kenttä on pakollinen./     ==      1.0

8. Special charactors are ignored by system and only numbers are taken into use
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     11!"#€%&&/()=?*;:1
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count               text=/.*RF.*/     ==      1

9. Alphabet is not allowed to be input
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     abcdefghijklmn
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count   text=/.Kenttä on pakollinen./     ==        1

10. Alphabet is not allowed to be input initial value
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     opqrstuvwlyz
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count   text=/.Kenttä on pakollinen./     ==        1

11. Alphabet is not allowed to be input initial value
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     1e2
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count   text=/.Kenttä on pakollinen./     ==        1.0

 12. Check the Value of the First result is According to Coverting Rules
    click           text = Hyväksy kaikki evästeet
     # choose international reference function
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  value       10
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     123
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Get Element Count               text=/.*RF.*/     ==      10
    ${REF} =  Get text  //*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[4]/table/tr/td
    ${VALID} =  Rf ref number is valid  ${REF}
    Should be true  ${VALID}



*** Keywords ***

Setup Test Suite
    [Arguments]     ${headless}=true
    New Browser     chromium    headless=${headless}
    New Page        https://www.aktia.fi/fi/yritysasiakkaat/viitenumerolaskuri






