#!/usr/bin/env bash

PROGRAM="postgresql"
log "Setting up $PROGRAM"
if [[ "$OS" == "macos" ]]; then
  skip_program $PROGRAM
elif [[ "$OS" == "arch" ]]; then
  sudo pacman -S --noconfirm $PROGRAM
  sudo systemctl enable postgresql.service

  # Initialize the database cluster if not already done
  if ! sudo -u postgres test -f /var/lib/postgres/data/PG_VERSION; then
    sudo -u postgres initdb -D /var/lib/postgres/data --encoding=UTF8 --locale=en_US.UTF-8
  fi

  sudo systemctl start postgresql.service

  # Set timezone to UTC
  sudo -u postgres psql -c "ALTER SYSTEM SET timezone = 'UTC';"
  sudo systemctl restart postgresql.service

  # Create lorenzo user with no password (trust auth)
  sudo -u postgres psql -c "DO \$\$ BEGIN
    IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'lorenzo') THEN
      CREATE ROLE lorenzo WITH LOGIN;
    END IF;
  END \$\$;"

  sudo -u postgres psql -c "SELECT 1 FROM pg_database WHERE datname = 'lorenzo'" | grep -q 1 \
    || sudo -u postgres createdb -O lorenzo lorenzo

  sudo -u postgres psql -c "ALTER ROLE lorenzo CREATEDB;"
  
  sudo pacman -S --noconfirm postgis

  log "$PROGRAM setup complete (timezone set to UTC)"
elif [[ "$OS" == "apt" ]]; then
  sudo apt-get install -y $PROGRAM

  sudo systemctl enable --now postgresql.service

  # Set timezone to UTC
  sudo -u postgres psql -c "ALTER SYSTEM SET timezone = 'UTC';"
  sudo systemctl restart postgresql.service

  log "$PROGRAM setup complete (timezone set to UTC)"
fi
