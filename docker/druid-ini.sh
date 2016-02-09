#!/usr/bin/env bash

WEB_SRC="/usr/src/druid/src/main/php"
WEB_ROOT="/var/www"
DOCUMENT_ROOT="$WEB_ROOT/webapp"

if [ ! -d $DOCUMENT_ROOT ]; then
    echo "copy DRUID to DOCUMENT_ROOT $DOCUMENT_ROOT"
    (cd $WEB_SRC; tar cvf - .) | (cd $WEB_ROOT; tar xvf -)
    echo "Setting owner and permissions"
    chown -R www-data:www-data $WEB_ROOT
fi

apache2-foreground