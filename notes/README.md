# Documentation

Here you'll find useful info about **callcredit** gem

## Datasets

The line

    <soap:creditrequest schemaversion="7.0" datasets="255">

the key here is **datasets** and it's value of **255** it means: give
me as much info as you have on the person I'm currently looking up.

For more info on **datasets** consult section 8.4 in Call Credit's API
guide.

## Manual Password Change

If for whatever reason you forget the password for the app, it can be
changed here:

[for test](https://ct.callcreditsecure.co.uk/Prove/ChangePassword/Step1.aspx?p=3)

[for production](https://www.callcreditsecure.co.uk/Prove/ChangePassword/Step1.aspx?p=3)

## Electoral roll

**ervalid** is the key and has to be extracted as follows (below is an xpath of the XML response):

//addressconf[address/@current=1]/resident[@matchtype="IM" and (@currentname=1 or @declaredalias=1)]/ervalid
             \__________________/         \______________/     \__________________________________/
                      ^                          ^                                ^
                      |                          |                                |
     This means the record pertains to    This means the person     The match relates to either
     the address you have declaired in    has matched to the        the name you have declared, or
     the search                           electoral roll            a declared alias (e.g. maiden name)
                                          at individual level
