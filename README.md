# KCTX

Simple CLI tool to switch Kubernetes contexts based on `.yaml` kubeconfig files.

For Brazilian Portuguese version, see [README.ptBR.md](README.ptBR.md)

---

## Motivation

Managing multiple Kubernetes clusters typically requires merging kubeconfig files into a single `config`. For temporary or frequently changing clusters, this approach can be cumbersome, requiring constant edits and cleanups.

**KCTX** provides a lightweight alternative: it keeps kubeconfig files separate and allows you to quickly switch the active config by copying the chosen file to `~/.kube/config`. It also tracks the currently active context for convenience.

---

## Features

* Lists all `.yaml` kubeconfig files in `~/.kube`
* Marks the currently active kubeconfig
* Switches kubeconfig by copying the selected file to `~/.kube/config`
* Remembers the active kubeconfig in `~/.kube/.kctx`
* No need to merge or manually edit config files

---

## Installation

```bash
curl -sfL https://deividfrancis.github.io/kctx/install.sh | sh -
```

---

## Usage

```bash
# List available kubeconfigs (active one marked with ✅)
kctx

# Switch to a specific kubeconfig
kctx <config-name>

# Show the currently active kubeconfig
kctx show

# Display help
kctx -h | --help
```

---

## Example

```bash
$ kctx
Available kubeconfig files:
✅ k3s-dev-1
   k3s-prod

$ kctx k3s-prod
Switched to kubeconfig: k3s-prod

$ kctx show
Active kubeconfig: k3s-prod
```

---

## License

MIT License — feel free to use and contribute.

---

If you want a more advanced usage guide or integration with namespace tools like `kubens`, feel free to open an issue or pull request.
