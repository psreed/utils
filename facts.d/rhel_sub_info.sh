#!/bin/bash
#Add fact for RHEL subscription info/status

if [[ -f /etc/redhat-release && $(cat /etc/redhat-release) == *"Enterprise Linux"* ]]; then
    OIFS=$IFS; IFS=;
    STATUS=$(subscription-manager status)
    PURPOSE=$(subscription-manager syspurpose)
    SCA=$(echo $STATUS | grep "Content Access Mode is set to Simple Content Access.")
    if [ $? == 0 ]; then
            echo "{\"rhel_sub_info\": { \"status\": \"Subscribed\", \"info\": \"Simple Content Access \(SCA\) Enabled\", \"syspurpose\": ${PURPOSE} } }"
    else
            OSTATUS=$(echo ${STATUS} | grep "Overall Status:" | awk '{print $2}')
            echo "{\"rhel_sub_info\": { \"status\": \"${OSTATUS}\", \"info\": \"${STATUS}\", \"syspurpose\": ${PURPOSE} } }"
    fi
    IFS=$OIFS
fi