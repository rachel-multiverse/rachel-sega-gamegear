# Rachel - Sega Game Gear Client

A Rachel card game client for the Sega Game Gear.

## Platform Details

- **CPU**: Zilog Z80 @ 3.58 MHz
- **RAM**: 8KB
- **Graphics**: VDP (SMS compatible, 160x144 visible)
- **Platform ID**: `0x00C4` (196)
- **Player Name**: "GAME GEAR"

## Building

Requires [pasmo](http://pasmo.speccy.org/) Z80 assembler:

```bash
make
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

Uses RUBP (Rachel Universal Binary Protocol):
- 64-byte fixed-size messages
- 16-byte header with "RACH" magic
- 48-byte payload

## Compatibility

- Sega Game Gear
- Master System (via adapter, with display cropping)
