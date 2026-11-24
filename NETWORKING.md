# Bedrock networking

For Bedrock 1.26.50+ using NetherNet:

- TCP port 19132 is used for the initial connection.
- UDP gameplay traffic uses a configurable port range.
- The hosting provider must support both protocols and the configured UDP range.

Railway documents its public game-server proxy as TCP. That feature alone is insufficient for this Bedrock networking mode.

Playit's official NetherNet instructions currently describe the tunnel as experimental. Verify the current plan and support before relying on it.

Do not publish a server address until an actual Android client connection test succeeds.
