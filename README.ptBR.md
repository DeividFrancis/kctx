# KCTX

Ferramenta CLI simples para alternar contextos Kubernetes baseada em arquivos kubeconfig `.yaml`.

Para a versão em inglês, veja [README.md](README.md)

---

## Motivação

Gerenciar múltiplos clusters Kubernetes normalmente exige juntar vários arquivos kubeconfig em um único arquivo `config`. Para clusters temporários ou que mudam com frequência, isso pode ser trabalhoso, exigindo edições e limpezas constantes.

O **KCTX** oferece uma alternativa leve: mantém os arquivos kubeconfig separados e permite alternar rapidamente o arquivo ativo copiando o escolhido para `~/.kube/config`. Também registra qual está ativo para facilitar o uso.

---

## Funcionalidades

* Lista todos os arquivos kubeconfig `.yaml` em `~/.kube`
* Marca qual kubeconfig está ativo no momento
* Alterna o kubeconfig ativo copiando o arquivo selecionado para `~/.kube/config`
* Registra o arquivo ativo em `~/.kube/.kctx`
* Não exige merge ou edição manual dos arquivos

---

## Instalação

```bash
curl -sfL https://raw.githubusercontent.com/deividfrancis/kctx/main/install.sh | sh -
```

---

## Uso

```bash
# Lista os kubeconfigs disponíveis (o ativo aparece com ✅)
kctx

# Alterna para o kubeconfig especificado
kctx <nome-do-config>

# Mostra o kubeconfig ativo no momento
kctx show

# Exibe a ajuda
kctx -h | --help
```

---

## Exemplo

```bash
$ kctx
Arquivos kubeconfig disponíveis:
✅ k3s-dev-1
   k3s-prod

$ kctx k3s-prod
Kubeconfig trocado para: k3s-prod

$ kctx show
Kubeconfig ativo: k3s-prod
```

---

## Licença

Licença MIT — fique à vontade para usar e contribuir.

---

Se quiser uma seção de uso avançado ou integração com ferramentas de namespaces como o `kubens`, fique à vontade para abrir uma issue ou pull request.

