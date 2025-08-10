#!/bin/bash

set -e

BIN_DIR="$HOME/bin"
SCRIPT_NAME="kctx"
SCRIPT_PATH="$BIN_DIR/$SCRIPT_NAME"
KCTX_SCRIPT_URL="https://raw.githubusercontent.com/deividfrancis/kctx/main/kctx.sh"

echo "🚀 Starting kctx installation..."

# Create ~/bin directory if it doesn't exist
if [ ! -d "$BIN_DIR" ]; then
    echo "📂 Creating directory $BIN_DIR"
    mkdir -p "$BIN_DIR"
fi

# Download the main kctx script from GitHub
echo "📥 Downloading $SCRIPT_NAME script..."
curl -sfL "$KCTX_SCRIPT_URL" -o "$SCRIPT_PATH"

# Make the script executable
chmod +x "$SCRIPT_PATH"
echo "🔑 Set executable permission for $SCRIPT_PATH"

# Check if ~/bin is in the PATH environment variable
if ! echo "$PATH" | grep -q "$BIN_DIR"; then
    echo "🛠 Adding $BIN_DIR to PATH in ~/.bashrc"
    echo "export PATH=\"\$HOME/bin:\$PATH\"" >> "$HOME/.bashrc"
    echo "⚠️ Please run 'source ~/.bashrc' or restart your shell to apply changes."
fi

echo "✅ kctx installed successfully!"
echo "You can now run 'kctx' from your terminal."
