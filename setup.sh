#!/usr/bin/env bash

set -e

REPO="wayne45/venv-launcher"
BRANCH="main"
BASE_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}"

echo "Downloading venv-launcher..."

curl -sLO "${BASE_URL}/venv.sh"
curl -sLO "${BASE_URL}/.gitignore"

if [ ! -f "requirements.txt" ]; then
    touch requirements.txt
fi

chmod +x venv.sh

echo "Done! Edit requirements.txt then run:"
echo "  ./venv.sh <command>"
