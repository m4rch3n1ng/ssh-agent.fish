# ssh agent plugin for fish

a fish shell plugin for launching the ssh-agent and keeping it running

## install

install using [fisher](https://github.com/jorgebucaran/fisher)

```sh
$ fisher install m4rch3n1ng/ssh-agent.fish
```

and add this line to the end of your [config.fish](https://fishshell.com/docs/current/language.html#configuration)

```sh
fish_ssh_agent
```

if you don't want to automatically start the ssh agent on shell startup
but instead want to manually start the ssh-agent using `$ ssh-add` add `--manual` as an argument

```sh
fish_ssh_agent --manual
```

## info

this is modeled after [this stackoverflow answer](https://stackoverflow.com/a/18915067), but converted to be used with fish.
