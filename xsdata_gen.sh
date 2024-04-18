#!/usr/bin/bash


generate_xsdata() {
    package=$1
    directory=$2

    list_of_xsd=$(find $directory -name "*.xsd")

    for xsd in $list_of_xsd
    do
        filename=$(basename "$xsd" .xsd)
        filename=$(echo $filename | tr '.' '_')
        xsdata $xsd --package pyiso20022.$package.$filename
    done
}

generate_xsdata "pacs" "xsd/payments_clearing_and_settlement"
generate_xsdata "head" "xsd/business_application_header"


