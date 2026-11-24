# Railway service setup

This is a reference checklist, not a secret file. Do not commit tunnel tokens.

## Required volume

Create a Railway Volume and mount it at:

`/data`

## Container variables

The Dockerfile already sets these defaults. You can override them in Railway Variables:

| Variable | Value |
|---|---|
| `EULA` | `TRUE` (only after reading and accepting the EULA) |
| `VERSION` | `LATEST` |
| `SERVER_NAME` | `Friends SMP` |
| `GAMEMODE` | `survival` |
| `FORCE_GAMEMODE` | `true` |
| `DIFFICULTY` | `normal` |
| `ALLOW_CHEATS` | `true` |
| `MAX_PLAYERS` | `10` |
| `ONLINE_MODE` | `true` |
| `ALLOW_LIST` | `true` |
| `DEFAULT_PLAYER_PERMISSION_LEVEL` | `member` |
| `LEVEL_NAME` | `FriendsSMP` |
| `LEVEL_TYPE` | `infinite` |

## Networking blocker

Bedrock 1.26.50+ uses NetherNet: TCP 19132 and UDP gameplay ports are required. Railway TCP Proxy is TCP-only. Do not create a TCP-only proxy and assume Bedrock clients will connect.

A compatible external ingress/tunnel must support the required NetherNet TCP+UDP traffic. Confirm current plan requirements and costs with that provider before purchasing.
