# Rachel - Sega Game Gear Client

A Rachel card game client for the Sega Game Gear.

## Platform Details

- **CPU**: Zilog Z80 @ 3.58 MHz
- **RAM**: 8KB
- **Graphics**: VDP (SMS compatible, 160x144 visible)
- **Platform ID**: `0x0017` (23)
- **Player Name**: "GAME GEAR"

## Building

Asm198x 0.0.51 is the primary assembler. Pasmo remains a byte-for-byte
reference oracle:

```bash
make

# Build, verify the Sega header/checksum and compare with Pasmo
make check
```

Output: `build/rachel.gg` (32KB ROM)

## Hardware Notes

The Game Gear is essentially a portable Master System with:
- Smaller visible screen area (160x144 vs 256x192)
- Different color palette encoding (12-bit vs 6-bit)
- Built-in backlit LCD
- Same Z80 CPU and VDP architecture

## Controls

- **D-Pad**: Navigate hand
- **Button 1**: Select/deselect card
- **Button 2**: Play selected cards
- **Start**: Draw card

## Protocol

Uses RUBP (Rachel Unified Binary Protocol):
- 64-byte fixed-size messages
- 16-byte header with "RACH" magic
- 48-byte payload
- RachelSpec v1 actions with observed-state hashes
- Public `GAME_STATE` and private `GAME_START`/`CARD_DRAWN`/`HAND_SYNC`
- Up to 32 selectable cards and ace suit nomination

Full specification: [rachel-multiverse/protocol](https://github.com/rachel-multiverse/protocol) — also rendered at <https://rachel.stevehill.xyz/protocol>.

## Compatibility

- Sega Game Gear
- Master System (via adapter, with display cropping)
