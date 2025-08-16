#!/bin/bash
#
#
#       Sets up a dev env with all pre-reqs. This script is idempotent, it will
#       only attempt to install dependencies, if not exists.   
#
# ---------------------------------------------------------------------------------------
#

set -e
set -m

echo ""
echo "┌────────────────────────────────────┐"
echo "│ Checking for language dependencies │"
echo "└────────────────────────────────────┘"
echo ""

if ! command -v python3 &> /dev/null; then
    echo "Installing Python $PYTHON_VERSION..."
    sudo apt update
    sudo apt upgrade -y
    sudo apt install -y python3 python3-pip python3-dev python3-venv build-essential
fi

if ! command -v rustc &> /dev/null; then
    echo "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    . "$HOME/.cargo/env"
fi

if ! command -v java &> /dev/null; then
    echo "Installing Java (OpenJDK 11)..."
    sudo apt update
    sudo apt install -y openjdk-11-jdk
    
    JAVA_HOME_PATH="/usr/lib/jvm/java-11-openjdk-amd64"
    echo "export JAVA_HOME=$JAVA_HOME_PATH" >> ~/.bashrc
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
    export JAVA_HOME=$JAVA_HOME_PATH
    export PATH=$JAVA_HOME/bin:$PATH
    
    echo "JAVA_HOME set to: $JAVA_HOME"
fi

echo ""
echo "┌──────────────────────┐"
echo "│ Installing CLI tools │"
echo "└──────────────────────┘"
echo ""

if ! command -v docker &> /dev/null; then
    echo "docker not found - installing..."
    curl -sL https://get.docker.com | sudo bash
fi
sudo chmod 666 /var/run/docker.sock

if ! command -v duckdb &> /dev/null; then
    echo "duckdb not found - installing..."
    curl https://install.duckdb.org | sh
    export PATH="$HOME/.duckdb/cli/latest:$PATH"
fi

echo ""
echo "┌───────────────────────────────┐"
echo "│ Installing VS Code extensions │"
echo "└───────────────────────────────┘"
echo ""

code --install-extension github.copilot
code --install-extension ms-python.python
code --install-extension ms-python.vscode-pylance
code --install-extension ms-toolsai.jupyter
code --install-extension rust-lang.rust-analyzer
code --install-extension vadimcn.vscode-lldb

echo ""
echo "┌──────────┐"
echo "│ Versions │"
echo "└──────────┘"
echo ""

echo "Docker: $(docker --version)"
echo "Python: $(python3 --version)"
echo "Rust: $(rustc --version)"
echo "Cargo: $(cargo --version)"
echo "DuckDB: $(duckdb --version)"
if command -v java &> /dev/null; then
    echo "Java: $(java -version 2>&1 | head -n 1)"
    echo "JAVA_HOME: $JAVA_HOME"
fi