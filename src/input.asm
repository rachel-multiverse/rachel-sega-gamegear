; =============================================================================
; SEGA MASTER SYSTEM INPUT MODULE
; =============================================================================

; =============================================================================
; Read Joypad
; Joypad bits are active LOW
; Bit 0: Up
; Bit 1: Down
; Bit 2: Left
; Bit 3: Right
; Bit 4: Button 1 (TL)
; Bit 5: Button 2 (TR)
; =============================================================================
read_joypad:
        ; Save old state
        ld      a, (joypad)
        ld      (joypad_old), a

        ; Read controller 1
        in      a, (IO_CTRL1)

        ; Invert (buttons are active low)
        cpl
        and     $3F             ; Mask to 6 bits
        ld      b, a

        ; Game Gear Start is bit 7 (active low) on port $00. Map it to
        ; joypad bit 6 so it participates in the same edge detection.
        in      a, (IO_GG_START)
        cpl
        and     $80
        rrca
        or      b
        ld      (joypad), a

        ; Calculate newly pressed buttons
        ld      b, a
        ld      a, (joypad_old)
        cpl
        and     b
        ld      (joypad_new), a
        ret
