#!/bin/bash

KUBE_DIR="$HOME/.kube"
ACTIVE_FILE="$KUBE_DIR/.kctx"

# Show help
show_help() {
    cat <<EOF
Usage: kctx [command|kubeconfig-name]

Commands:
  kctx               List all .yaml files in $KUBE_DIR, marking the active one
  kctx <name>        Activate kubeconfig <name>.yaml
  kctx show          Show the currently active kubeconfig
  kctx -h | --help   Display this help message

Examples:
  kctx               # List available kubeconfigs
  kctx k3s-dev-1     # Use ~/.kube/k3s-dev-1.yaml as the active config
  kctx show          # Show which kubeconfig is currently in use
EOF
}

# List configs and mark the active one
list_configs() {
    local active=""
    if [[ -f "$ACTIVE_FILE" ]]; then
        active=$(cat "$ACTIVE_FILE")
    fi

    echo "Available kubeconfig files:"
    for file in "$KUBE_DIR"/*.yaml; do
        [[ -e "$file" ]] || continue
        local name
        name=$(basename "$file" .yaml)
        if [[ "$name" == "$active" ]]; then
            echo "✅ $name"
        else
            echo "   $name"
        fi
    done
}

# Show active config
show_active() {
    if [[ -f "$ACTIVE_FILE" ]]; then
        echo "Active kubeconfig: $(cat "$ACTIVE_FILE")"
    else
        echo "No active kubeconfig."
    fi
}

# Switch active config
switch_config() {
    local name="$1"
    local file="$KUBE_DIR/$name.yaml"

    if [[ ! -f "$file" ]]; then
        echo "File '$file' not found."
        exit 1
    fi

    cp "$file" "$KUBE_DIR/config"
    echo "$name" > "$ACTIVE_FILE"
    echo "Switched to kubeconfig: $name"
}

# Main logic
case "$1" in
    "" )
        list_configs
        ;;
    show )
        show_active
        ;;
    -h|--help )
        show_help
        ;;
    * )
        switch_config "$1"
        ;;
esac
