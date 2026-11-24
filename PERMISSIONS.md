# Permissions plan

## Built-in Bedrock permission levels

- `visitor`: limited interaction
- `member`: normal gameplay
- `operator`: administrative commands

## Initial policy

- Owner: operator (add the owner's exact Xbox Gamertag to `ops.json` after the first server boot).
- Members: member.
- Moderators: member until a tested teleport-only command system is selected.

## Why moderators are not operators

Bedrock Dedicated Server does not have a built-in per-command permission editor that grants `/tp` while denying every other operator command. Giving a moderator operator status would grant too much authority.

Do not add moderators to `ops.json` for the requested teleport-only role. We will implement and test a separate supported add-on/command approach before changing this.
