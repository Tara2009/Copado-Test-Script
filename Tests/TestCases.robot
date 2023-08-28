# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Resource                      ../resources/common.robot
Suite Setup                   Setup Browser
Suite Teardown                End suite


*** Test Cases ***
Entering a Contacts
    [Tags]                            Contact
    Appstate                          Home
    LaunchApp                         Sales
    ClickText                         Contacts
    ClickUntil                        New Contact              New
    UseModal                          On
    TypeText                          Phone                    +917398867459
    Picklist                          Salutation               Sr.
    TypeText                          First Name               tara srinivas11
    TypeText                          Last Name                chandika
    ComboBox                          Search Accounts...       tara siri account7
    TypeText                          Email                    tvsh@gmail.com
    TypeText                          Title                    project11
    TypeText                          Mailing Street           hanuman nagar 4th line
    TypeText                          Mailing City             guntur
    TypeText                          Mailing State/Province   ap
    TypeText                          Mailing Zip/Postal Code  522006
    TypeText                          Mailing Country          india
    TypeText                          Other Street             vijayapuri colony
    TypeText                          Other City               guntur
    TypeText                          Other State/Province     ap
    TypeText                          Other Zip/Postal Code    52206
    TypeText                          Other Country            india
    TypeText                          Fax                      7398878560
    PickList                          Lead Source              Publicidad
    TypeText                          Home Phone               8987
    ClickText                         Birthdate                anchor=Home Phone
    DropDown                          Pick a Year              1979
    ClickText                         Previous                 Month
    ClickText                         Previous                 Month
    ClickText                         Previous                 Month
    ClickText                                                  20
    TypeText                          Other Phone              987946
    TypeText                          Department               tesing department
    TypeText                          Assistant                no assistant
    TypeText                          Asst. Phone              00000034
    TypeText                          Description              learning copado robotic testing
    ClickText                         Save                     partial_match=False
    UseModal                          Off
    ClickText                         Details

# End creation of contacts
Entering A Account
    [Tags]                    Account
   # Appstate                  Home
   # LaunchApp                 Sales
    ClickText                 Accounts
    ClickUntil                New Account                  New
    UseModal                  On
    TypeText                  Phone                        +7207207174
    TypeText                  Name                         tara siri account12
    TypeText                  Website                      www.tvsh.com
    VerifyText                Additional Information
    PickList                  Type                         Analista
    TypeText                  Employees                    88
    PickList                  Industry                     Educación
    TypeText                  Annual Revenue               84000000
    TypeText                  Description                  New need to do hardwork to improve the business
    TypeText                  Billing Street               My New House Hanumannagar 4th line
    TypeText                  Billing City                 guntur
    TypeText                  Billing State/Province       ap
    TypeText                  Billing Zip/Postal Code      522006
    TypeText                  Billing Country              india
    TypeText                  Shipping Street              My New House hanumannagar 4th line
    TypeText                  Shipping City                guntur
    TypeText                  Shipping State/Province      ap
    TypeText                  Shipping Zip/Postal Code     52206
    TypeText                  Shipping Country             india
    ClickText                 Save                         partial_match=False
    UseModal                  Off

    ClickText                 Details
    VerifyText                tara siri account12
    VerifyText                +7207207174
    VerifyText                www.tvsh.com

    # End Account creation test case
Entering A Lead
    [tags]                    Lead
    # Appstate                  Home
    # LaunchApp                 Sales
    ClickText                 Leads
    VerifyText                Change Owner
    ClickText                 New
    VerifyText                Lead Information
    UseModal                  On                          # Only find fields from open modal dialog
    Picklist                  Salutation                  Sr.
    TypeText                  First Name                  Please19
    TypeText                  Last Name                   Help19
    Picklist                  Lead Status                 New
    # generate random phone number, just as an example
    # NOTE: initialization of random number generator is done on suite setup
    ${rand_phone}=            Generate Random String      14                          [NUMBERS]
    # concatenate leading "+" and random numbers
    ${phone}=                 SetVariable                 +${rand_phone}
    TypeText                  Phone                       ${phone}                    First Name
    TypeText                  Company                     Growmore                    Last Name
    TypeText                  Title                       Manager                     Address Information
    TypeText                  Email                       sirisha.tara@gmail.com        Rating
    TypeText                  Website                     https://www.growmore.com/

    Picklist                  Lead Source                 Web
    ClickText                 Save                        partial_match=False
    UseModal                  Off
    Sleep                     1
    
    ClickText                 Details
    VerifyField               Name                        Sr. Please19 Help19
    VerifyField               Lead Status                 New
    VerifyField               Phone                       ${phone}
    VerifyField               Company                     Growmore
    VerifyField               Website                     https://www.growmore.com/

    # as an example, let's check Phone number format. Should be "+" and 14 numbers
    ${phone_num}=             GetFieldValue               Phone
    Should Match Regexp	      ${phone_num}	              ^[+]\\d{14}$
    
    ClickText                 Leads
    VerifyText                Please19 Help19
    VerifyText                Manager
    VerifyText                Growmore   
    

Converting Lead To Opportunity
    [tags]                    Lead
    ClickText                 Leads
    VerifyText                Change Owner
    ClickText                 Please4 Help4                    
    ClickUntil                Convert Lead                       convert
    UseModal                  On
    ClickText                 Opportunity                         2
    TypeText                  Opportunity Name                   convert lead Please4 Help4 to opportunity
    ClickText                 Convert                            2
    VerifyText                Your lead has been converted       timeout=30
    UseModal                  Off
    UseModal                  On
    ClickText                 Go to Leads
    UseModal                  Off
    TypeText                  Search this list...                Please4\n
    ClickText                 Opportunities
    ClickText                 convert lead Please4 Help4 to opportunity

