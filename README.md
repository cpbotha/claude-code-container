# Claude Code Container

Barebones setup with docker and docker compose that starts a UV / Python / Trixie / claude code container with the
current folder bind mounted, so that you can isolate caude's work to the bind-mounted folder.

To start this up:

```shell
docker compose build
docker compose run claude-code
```
