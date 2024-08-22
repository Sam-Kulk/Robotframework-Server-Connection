*** Settings ***
Library    SSHLibrary

*** Test Cases ***
practice
    open connection    172.2.3.000    server_000    22    10

    login     comviva    comviva@1234
    # login with public key

    execute command    mkdir sam    sudo=True
    # ${logs}=    execute command    tail -f sam.log
    # log    ${logs}

    # or
#    ${cmd}=    Set Variable    cd ${kafa_topics_path} && rm -f Automation*.json
#    Execute Command        ${cmd}

# Note:
# I can connect to multiple servers, using multiple 'open connections'
# By default control will switch to new connection
# To execute any cmd on a specific connection, here I need to first switch the connection 'switch connection' & then execute commands.


    open connection    172.3.3.111    server_111    22    10
    login     comviva    comviva@1234
    # now control will be on 111 server
    switch connection    server_000

    # close connection
    close all connections



