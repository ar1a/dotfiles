# dotfiles

## install
`sh -c "$(curl -fsLS get.chezmoi.io/lb)" -- init --apply ar1a`

## secrets
secrets rely on `op` being available on the path, make sure you setup
[1password cli](https://developer.1password.com/docs/cli/get-started)

to add a new secret do something like

```bash
$ eval $(op signin)
$ op document create $file --tags chezmoi --title $file
$ chezmoi add --template $file
```

and edit template accordingly (probably with `{{ onepasswordRead "op://app-prod/db/password" }}`)

