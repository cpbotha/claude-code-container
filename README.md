# Claude Code Container

Barebones setup with docker and docker compose that starts a UV / Python / Trixie / claude code container with the
current folder bind mounted, so that you can isolate caude's work to the bind-mounted folder.

To start this up:

```shell
# CRUCIALLY IMPORTANT before first run (only then), else claude will fail
echo "{}" > .claude.json
docker compose up -d
docker compose exec claude-code tmux attach
```

## Optional extras


### Change workspace dir

By default, the current working directory is bind mounted into the container as `/workspace`. If you want to work on
another directory, then do:

```shell
WORKSPACE_DIR=/some/other/dir docker compose run claude-code
```

### Use Claude Code with OpenRouter

If you have Claude Code setup to use OR instead of Anthropic [1], the relevant environment variables will be passed
through to the container, which will use the same OR setup.

[1] https://openrouter.ai/docs/guides/guides/claude-code-integration
