# Claude Code Container

Barebones setup with docker and docker compose that starts a UV / Python / Trixie / claude code container with the
current folder bind mounted, so that you can isolate caude's work to the bind-mounted folder.

To start this up:

```shell
docker compose build
# CRUCIALLY IMPORTANT before first run (only then), else claude will fail
echo "{}" > .claude.json
docker compose run claude-code
```
