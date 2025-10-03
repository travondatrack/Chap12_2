#!/bin/bash

# Script to substitute environment variables in context.xml at startup
# This handles the issue where Tomcat may not substitute ${env.VAR} placeholders correctly

CONTEXT_FILE="/usr/local/tomcat/webapps/ROOT/META-INF/context.xml"

if [ -f "$CONTEXT_FILE" ]; then
    echo "Substituting environment variables in context.xml..."
    
    # Use envsubst to replace environment variables
    envsubst < "$CONTEXT_FILE" > "/tmp/context.xml.tmp"
    mv "/tmp/context.xml.tmp" "$CONTEXT_FILE"
    
    echo "Environment variable substitution completed."
fi

# Start Tomcat
exec catalina.sh run