#!/bin/bash

# Simple approach: start Tomcat in background, wait for extraction, then substitute
echo "Starting Tomcat in background..."
catalina.sh start

echo "Waiting for WAR extraction..."
sleep 15

CONTEXT_FILE="/usr/local/tomcat/webapps/ROOT/META-INF/context.xml"

if [ -f "$CONTEXT_FILE" ]; then
    echo "Substituting environment variables..."
    sed -i "s/\$DB_URL/$DB_URL/g" "$CONTEXT_FILE"
    sed -i "s/\$DB_USERNAME/$DB_USERNAME/g" "$CONTEXT_FILE"
    sed -i "s/\$DB_PASSWORD/$DB_PASSWORD/g" "$CONTEXT_FILE"
    echo "Substitution completed."
    
    echo "Restarting Tomcat..."
    catalina.sh stop
    sleep 5
fi

echo "Starting Tomcat in foreground..."
exec catalina.sh run