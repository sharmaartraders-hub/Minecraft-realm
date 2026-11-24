# Friends SMP — Minecraft Bedrock

A starter repository for a private, vanilla-style Minecraft Bedrock survival server.

## Planned settings

- Minecraft client: Bedrock / Google Play
- Target client reported by owner: 1.26.66.1
- Server software: official Bedrock Dedicated Server, supplied by the `itzg/minecraft-bedrock-server` container
- Game mode: Survival
- Difficulty: Normal
- Maximum players: 10
- World: Infinite / normal
- Cheats: enabled (for owner administration)
- Persistent server data: `/data`

## Important networking note (read before deploying)

Bedrock 1.26.50+ uses NetherNet. It needs TCP 19132 plus a range of UDP gameplay ports. Railway's documented public game-server proxy is TCP-only, so a Railway TCP proxy by itself is **not enough** for this Bedrock server.

Playit documents a separate **Minecraft Bedrock (NetherNet)** tunnel and marks it experimental; its current product page lists NetherNet under Premium. Do not assume the older free RakNet/UDP tunnel will work with this client.

Before paying for anything, confirm that the chosen host/tunnel supports the required NetherNet TCP and UDP traffic. A host with native inbound TCP and UDP support is the simplest option.

Official references:
- https://www.minecraft.net/en-us/download/server/bedrock
- https://help.minecraft.net/hc/en-us/articles/49914677714957
- https://docs.railway.com/networking/tcp-proxy
- https://playit.gg/support/minecraft-bedrock-nethernet/
- https://github.com/itzg/docker-minecraft-bedrock-server

## Deploying on Railway

1. Push this repository to GitHub.
2. Create a Railway project and deploy this repository from GitHub.
3. Railway should detect the `Dockerfile`.
4. Add a Railway Volume to the service with mount path **`/data`**. Without this, the world may be lost when the container is replaced.
5. Do not treat the server as publicly playable until you have a verified NetherNet-compatible TCP+UDP ingress path. Railway's ordinary TCP Proxy only handles TCP.
6. Set resource limits appropriate to the current Railway plan and monitor usage. This repository does not guarantee a free or fixed-cost 24/7 service.

## First boot and EULA

The container is configured with `EULA=TRUE`. This means the operator is accepting the Minecraft EULA on behalf of the server. Read the current terms first:
https://www.minecraft.net/en-us/eula

## Player permissions — current limitations

Vanilla Bedrock Dedicated Server has broad built-in permission levels (visitor, member, operator). It does **not** provide a native "moderator can only teleport" permission preset.

For the initial safe setup:
- Owner: add your own Xbox Gamertag to the server's `ops.json` after first boot.
- Members: normal survival players.
- Moderators: keep them as `member` until a tested, compatible command/add-on solution is selected. Do not grant `operator` if you want to prevent other admin commands.

A teleport-only moderator system is a later feature and is not falsely claimed to be included in this starter.

## Configuration

Railway service variables are defined in `railway-variables.example.md`.
The server writes its live files and world under `/data`.

## Backups

Create regular backups of the Railway `/data` volume. A persistent volume is not a substitute for a backup.

## Repository contents

- `Dockerfile` — Bedrock server container configuration
- `.dockerignore` — excludes local/runtime files
- `.gitignore` — excludes secrets and local data
- `railway-variables.example.md` — variables and Railway setup notes
- `docs/permissions.md` — current permission model and next steps
