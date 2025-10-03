#!/bin/bash

# Script to substitute environment variables in context.xml at startup
# This handles the issue where Tomcat may not substitute ${env.VAR} placeholders correctly

echo "=== Environment Variables ==="
echo "DB_URL: $DB_URL"
echo "DB_USERNAME: $DB_USERNAME" 
echo "DB_PASSWORD: [HIDDEN]"

CONTEXT_FILE="/usr/local/tomcat/webapps/ROOT/META-INF/context.xml"

if [ -f "$CONTEXT_FILE" ]; then
    echo "=== Original context.xml ==="
    cat "$CONTEXT_FILE"
    
    echo "=== Substituting environment variables in context.xml ==="
    
    # Use envsubst to replace environment variables
    envsubst < "$CONTEXT_FILE" > "/tmp/context.xml.tmp"
    mv "/tmp/context.xml.tmp" "$CONTEXT_FILE"
    
    echo "=== Updated context.xml ==="
    cat "$CONTEXT_FILE"
    
    echo "Environment variable substitution completed."
else
    echo "ERROR: context.xml not found at $CONTEXT_FILE"
fi

# Start Tomcat
exec catalina.sh run