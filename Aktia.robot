# Test suite is to test the International invoicing reference code generator (Kansainvälinen viitenumero)
# system on Akia banking page
# Test suites ultilize external library Browser, python library check_RF_number.py. 
# Self created library check_RF_number.py must be downloaded
# Tests include input value check, output value check, format check and print format check


*** Settings ***
Library             Browser
Library             check_RF_number.py
Suite Setup         Setup Test Suite    headless=true
Suite Teardown      Close Browser
Test Setup          New Page            https://www.aktia.fi/fi/yritysasiakkaat/viitenumerolaskuri
Test Teardown       Close Context
# to run the test use: robot /path/Aktia.robot

*** Variables ***
#${VALID} =  ""
#${REF} = ""
#${user_input}=${EMPTY}

*** Test Cases ***
1. All result includes "RF" as initial, return same amount as chosen reference amount - RFXX 123
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

2. The customer initial numbers should not be longer than 20, error notification - 12345678901234567890
    click           text = Hyväksy kaikki evästeet
      # choose international reference function
    Click           //*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       10
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     12345678901234567890
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count       text=/.Kenttä ei saa olla pidempi kuin 19 merkkiä./     ==      1

3. The customer initial numbers should be less than 20 digits - 1234567890123456789
    click           text = Hyväksy kaikki evästeet
      # choose international reference function
    Click           //*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       10
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     1234567890123456789
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count               text=/.*RF.*/     ==      10

4. The customer initial should be numeric only - 11e1
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

5. The customer initial should be numeric only - 11E1
    click           text = Hyväksy kaikki evästeet
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[1]/div/div/div/div/div[2]/label/span
    # choose numbers of reference number that to be generated
    Click           id=rn-referencenumber-amount
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[1]/div[2]/div/div
    Select options by       select[id="rn-referencenumber-amount"]  Value       1
    Click           id=rn-first-referencenumber
    Type text       id=rn-first-referencenumber     11E1
    Click           xpath=//*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[3]/div[2]/button
    Take screenshot
    Get Element Count      text=/.Kenttä on pakollinen./     ==      1

6. The customer initial should be numeric only - 111e
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

7.The customer initial should be numeric only - e111
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

8. The customer initial should be numeric only - 111E
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
    Get Element Count   text=/.Kenttä on pakollinen./     ==      1

9. The customer initial should be numeric only - E111
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
    Get Element Count   text=/.Kenttä on pakollinen./     ==      1

10. Special charactors are ignored by system and only numbers are taken into use - 11!"#€%&&/()=?*;:1
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

11. Alphabet is not allowed to be input - abcdefghijklmn
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

12. Alphabet is not allowed to be input initial value - opqrstuvwlyz
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


 13. Check the Value of the First result is According to Coverting Rules
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
    #1. All result includes "RF" as initial
    Get Element Count               text=/.*RF.*/     ==      10
         #2. The 2-digit check according to converting rules
         #3. The customer inputs in included in the reference number from fifth digit onwards (before the last check number)
         #4. The customer inputs should not be longer than 19 digits, all numerics
         #5. The last number of generated reference number is Finnish reference checksum using the calculation method
         #6. The RF reference is printed in the field reserved for the reference number
         #7. Check Format: No leading zeros. Zeros on the front is not printed by system
         #8. Check format: Generated reference number is listed from left to right in groups of four numbers with a space between them
         #9. Check Value: ##The RF reference has a 2-digit check. It is calculated as follows in Finnish
         #based on reference number:
         # a series of numbers corresponding to the letters RF is added after the Finnish reference number
         #"2715" and "00"
         # Calculate modulo 97, ie the remainder of the division by dividing by the number in Section 1, 97
         # The remainder of the division is subtracted from Chapter 98 and the difference is a check. If the difference is less than
         # ten, is preceded by a leading zero##
         #
         #10. Print function check, in paper formate
         ### If the RF reference is in paper format, blank characters are deleted.
         #• The first four characters are moved after the reference number
         #• Alphabetic characters are replaced as follows #F = 15  R = 27
         #• Apply modulo 97, ie calculate the remainder by dividing the number in section 3 At 97
         #• If the division remainder is 1 (one), the check is correc##

    ${REF} =  Get text  //*[@id="MainContentSection_T17BA5993010_Col00"]/span/form/div/div/div/div[4]/table/tr/td
    ${VALID} =  Rf ref number is valid  ${REF}
    Should be true  ${VALID}



*** Keywords ***

Setup Test Suite
    [Arguments]     ${headless}=true
    New Browser     chromium    headless=${headless}
    New Page        https://www.aktia.fi/fi/yritysasiakkaat/viitenumerolaskuri






