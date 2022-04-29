#!/bin/sh
#Add fact for RHEL subscription info/status

if [[ -f /etc/redhat-release && $(cat /etc/redhat-release) == *"Enterprise Linux"* ]]; then   
    OIFS=$IFS; IFS=;
    LIST=$(subscription-manager list)
    STATUS=$(echo ${LIST} | grep "Status:" | awk '{print $2}')
    IFS=$OIFS
    echo "{\"rhel_sub_info\": { \"status\": \"${STATUS}\", \"info\": \"${LIST}\" } }"
fi
