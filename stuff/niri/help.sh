#!/bin/sh
less -~ +Gg --no-lessopen << 'EOF'
  NIRI KEYBINDINGS
  ──────────────────────────────────────────────────────

  LAUNCH
    Super + Return          Terminal (foot)
    Super + S               Launcher
    Super + D               Close window
    Super + B               Toggle overview

  FOCUS
    Super + H / L           Focus column left / right
    Super + J / K           Focus window down / up
    Super + Y / O           Focus monitor left / right
    Super + U / I           Focus workspace down / up
    Super + 1-9             Focus workspace N

  MOVE
    Super+Shift + H / L     Move column left / right
    Super+Shift + J / K     Move window down / up
    Super+Shift + Y / O     Move column to monitor left / right
    Super+Shift + U / I     Move column to workspace down / up
    Super+Ctrl  + 1-9       Move column to workspace N
    Super+Ctrl  + U / I     Move workspace down / up
    Super+Alt   + H / L     Consume / expel window left / right
    Super + , / .           Consume / expel window from column

  RESIZE & LAYOUT
    Super + R               Cycle column width presets
    Super+Shift + R         Cycle window height presets
    Super+Ctrl  + R         Reset window height
    Super + F               Maximize column
    Super+Shift + F         Fullscreen window
    Super+Ctrl  + F         Expand column to available width
    Super + C               Center column
    Super+Ctrl  + C         Center all visible columns
    Super + - / =           Shrink / grow column width
    Super+Shift + - / =     Shrink / grow window height

  FLOATING & TABS
    Super + V               Toggle floating
    Super+Shift + V         Switch focus: floating / tiling
    Super + W               Toggle tabbed column display

  SCREENSHOTS
    Super+Shift + S         Screenshot region  (copy to clipboard)
    Super+Shift + G         Screenshot fullscreen (copy to clipboard)
    Super+Shift + W         Screenshot window

  SYSTEM
    Super+Shift + P         Power off monitors
    Super+Escape            Toggle keyboard shortcuts inhibit
    Super+Shift + ?         Show this help
    Super+Shift + E         Quit niri

  ──────────────────────────────────────────────────────
  Press q to close
EOF
