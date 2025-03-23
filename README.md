# dotfiles

this relies on [chezmoi](https://www.chezmoi.io)

if you're looking for my old dotfiles, see [here](https://github.com/ar1a/dotfiles-old)

## install
`sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply ar1a`

## secrets
secrets rely on `op` being available on the path, make sure you setup
[1password cli](https://developer.1password.com/docs/cli/get-started) and
either the GUI or, if headless, use [service
accounts](https://developer.1password.com/docs/service-accounts/use-with-1password-cli#get-started)
alongside `~/.config/chezmoi/chezmoi.toml` containing:
```toml
[onepassword]
mode = "service"
```

### new secrets
to add a new secret do something like

```bash
# one of
$ eval $(op signin)
$  export OP_SERVICE_ACCOUNT_TOKEN=token
# may be necessary
$ op document create $file --tags chezmoi --title $file
$ chezmoi add --template $file
```

and edit template accordingly (probably with `{{ onepasswordRead "op://app-prod/db/password" }}`)

