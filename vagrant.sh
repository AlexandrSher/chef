#!/usr/bin/bash

SYSTEMS=$(vagrant status | grep running | cut -d ' '  -f1)

echo '[sandbox]' > inventory

for SYSTEM in ${SYSTEMS}; do
  SSHCONFIG=$(vagrant ssh-config ${SYSTEM})
  IDENTITY_FILE=$(echo "${SSHCONFIG}" | grep -o "\/.*${SYSTEM}.*")
  PORT=$(echo "${SSHCONFIG}" | grep -oE '[0-9]{4,5}')
  USER=$(echo "${SSHCONFIG}" | grep 'User ' | sed 's!  User !!g')
  echo "${SYSTEM} ansible_user=${USER} ansible_host=127.0.0.1 ansible_ssh_port=${PORT} ansible_ssh_private_key_file=${IDENTITY_FILE}" >> inventory
done

