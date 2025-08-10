#!/bin/bash

BIN_DIR="$HOME/bin"
SCRIPT_PATH="$BIN_DIR/kctx"

echo "🚀 Starting kctx installation..."

# Create ~/bin if it doesn't exist
if [[ ! -d "$BIN_DIR" ]]; then
    echo "📂 Creating directory: $BIN_DIR"
    mkdir -p "$BIN_DIR"
fi

# Copy kctx.sh to ~/bin/kctx
if [[ -f "./kctx.sh" ]]; then
    echo "📥 Installing kctx script..."
    cp ./kctx.sh "$SCRIPT_PATH"
else
    echo "❌ Error: kctx.sh not found in current directory."
    exit 1
fi

# Make it executable
chmod +x "$SCRIPT_PATH"
echo "🔑 Granted execute permissions to kctx."

# Ensure ~/bin is in PATH
if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
    echo "🛠 Adding $BIN_DIR to PATH in ~/.bashrc"
    echo "export PATH=\"\$HOME/bin:\$PATH\"" >> "$HOME/.bashrc"
    echo "⚠️ Run: source ~/.bashrc  to apply changes now."
fi

echo "✅ kctx installed successfully at: $SCRIPT_PATH"
echo "💡 Usage:"
echo "   kctx               -> List kubeconfigs (marks active one with ✅)"
echo "   kctx <name>        -> Switch to a kubeconfig"
echo "   kctx show          -> Show active kubeconfig"
echo "   kctx -h | --help   -> Show help"
