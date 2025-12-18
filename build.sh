#!/bin/bash

# Build script for local Hugo builds
# Updates the AZURE_STATIC_WEB_APPS workflow with the current Hugo version before building

# Get the current Hugo version (without the 'v' prefix and any additional info)
HUGO_VERSION=$(hugo version | grep -oP '(?<=v)\d+\.\d+\.\d+')

if [ -z "$HUGO_VERSION" ]; then
    echo "Error: Could not determine Hugo version"
    exit 1
fi

echo "Building with Hugo version: $HUGO_VERSION"

# Update the workflow file with the current Hugo version
WORKFLOW_FILE=".github/workflows/azure-static-web-apps-thankful-smoke-0bcb23d1e.yml"

if [ ! -f "$WORKFLOW_FILE" ]; then
    echo "Error: Workflow file not found at $WORKFLOW_FILE"
    exit 1
fi

# Replace the HUGO_VERSION in the workflow file
sed -i "s/HUGO_VERSION: [0-9]\+\.[0-9]\+\.[0-9]\+/HUGO_VERSION: $HUGO_VERSION/" "$WORKFLOW_FILE"

echo "Updated $WORKFLOW_FILE with HUGO_VERSION: $HUGO_VERSION"

# Build the site with cleanDestinationDir flag
echo "Building site..."
hugo --cleanDestinationDir

if [ $? -eq 0 ]; then
    echo "Build completed successfully"
    exit 0
else
    echo "Build failed"
    exit 1
fi
