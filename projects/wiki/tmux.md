
# Commands:
  Prefix by default is '<C-b>' however in my case is '<C-t>'
  * List sessions:
  ```console
    tmux ls
  ```
  * Attach to a session:
  ```console
    tmux attach-session -t <session>
  ```

  * Detach from session
  ```console
    prefix d
  ```
  * Show time
  ```console
    prefix t
  ```

  * Show numbers and jump to it (optional)
  ```console
    prefix q (number)
  ```
  
  * Kill session
  ```console
    tmux kill-ses -t <session>
  ```

  * Show all sessions
  ```console
    prefix s
  ```

  * Move between windows
  ```console
    C-S (left,right)arrow
  ```

  * Move between sessions
  ```console
    prefix ()
  ```

  * Pick different layouts
  ```console
    prefix M-#  (1, 2, ...)
  ```



