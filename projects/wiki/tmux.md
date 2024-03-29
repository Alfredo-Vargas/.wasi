# `Tmux` Commands:
- Prefix by default is '<C-b>' however in my case is '<C-t>'
- `tmux ls` : to list sessions
- `tmux attach-session -t <session-name>`
- `tmux a` : to attach to the last previous session
- `C-S left|right` : to change window position
- `prefix w #` : to change to the window given by number `#`
- `prefix c` : to create a new window in `tmux`
- `prefix d` : to detach from a session
- `prefix [` : get you in `tmux`  visual mode, then use `y` to yank/copy the selection
- `q` : to leave from visual mode
- `prefix ]` : to paste from `tmux` visual mode to any other pane or window
- `prefix t` : to show time
- `prefix x` : to close pane
- `prefix :kill-session` : to close all panes and windows of current session. Kills current session
- `prefix q` : to show pane numbers
- `tmux kill-ses -t <session-name>` : kills a given session from detach mode
- `prefix M-s` : list sessions when inside a session (remap from `tmux.conf`)
- `prefix C-S-Left|Right` : move between windows
- `prefix (|)` : to move between sessions
- `prefix M-# (1, 2, ...)` : to pick a different layout
- `prefix w` : to show current windows
