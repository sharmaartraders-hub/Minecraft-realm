# Bedrock Dedicated Server container.
# The upstream image downloads the official BDS software at container startup.
FROM itzg/minecraft-bedrock-server:latest

ENV EULA=TRUE \
    VERSION=LATEST \
    SERVER_NAME="Friends SMP" \
    GAMEMODE=survival \
    FORCE_GAMEMODE=true \
    DIFFICULTY=normal \
    ALLOW_CHEATS=true \
    MAX_PLAYERS=10 \
    ONLINE_MODE=true \
    ALLOW_LIST=true \
    DEFAULT_PLAYER_PERMISSION_LEVEL=member \
    LEVEL_NAME=FriendsSMP \
    LEVEL_TYPE=infinite \
    VIEW_DISTANCE=10 \
    TICK_DISTANCE=4 \
    PLAYER_IDLE_TIMEOUT=30

# Bedrock 1.26.50+ NetherNet:
# TCP 19132 is used for initial connection. UDP gameplay ports must also be
# made reachable by the hosting provider/tunnel. Railway's TCP proxy alone
# does not satisfy this requirement.
