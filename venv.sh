#!/usr/bin/env bash

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

VENV_DIR="${SCRIPT_DIR}/.venv"

if [ "$1" = "clean" ]; then
    echo "Removing virtual environment..."
    rm -rf "$VENV_DIR"
    echo "Done."
    exit 0
fi

if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv "$VENV_DIR"
    source "${VENV_DIR}/bin/activate"
    echo "Upgrading pip..."
    pip install -U pip
    if [ -s "${SCRIPT_DIR}/requirements.txt" ]; then
        echo "Installing requirements..."
        pip install -r "${SCRIPT_DIR}/requirements.txt"
    fi
else
    source "${VENV_DIR}/bin/activate"
fi

if [ $# -gt 0 ]; then
    "$@"
fi