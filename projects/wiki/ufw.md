 # My (ufw Uncomplicated Firewall) configurations:
  1. We first activate ufw
  ```bash
  sudo systemctl enable ufw.service
  sudo systemctl start ufw.service
  sudo systemctl enable ufw.service --now
  ```
  2. To list all apps that can be blocked
  ```bash
  sudo ufw app list
  ```
  3. My allows
  ```bash
  sudo ufw limit SSH
  sudo ufw allow CIFS
  ```
  4. To delete an app from the allow list
  ```bash
  sudo ufw status numbered
  sudo ufw delete 2
  ```
  5. To disable logs 
  ```bash
  sudo ufw loggin off
  ```
