#!/bin/bash

function create_venv {
# Check if virtualenv is installed, if not, install it
    
    local env_name=${1:-".venv"}

    if [ -d "$env_name" ]; then
        echo "Virtual environment '$env_name' already exists. Aborting."
        return 1
    fi

    python3 -m venv "$env_name"
}

function activate_venv {
    local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo "Virtual environment '$env_name' not found. Use '$0 create [env_name]' to create one."
        return 1
    fi

    source "./$env_name/bin/activate"
}

function install_deps {
    local env_name=${1:-".venv"}

    if [ ! -d "$env_name" ]; then
        echo "Virtual environment '$env_name' not found. Use '$0 create [env_name]' to create one."
        return 1
    fi

    source "./$env_name/bin/activate"

    if [ -f "requirements.txt" ]; then
        pip install -r ./requirements.txt
    fi
}

function main {
	create_venv
#	activate_venv 
#	install_deps
}

main
