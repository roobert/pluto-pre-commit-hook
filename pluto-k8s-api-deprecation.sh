#!/bin/bash

if ! which pluto; then
  echo "Please install pluto: https://pluto.docs.fairwinds.com/installation/"
  exit 1
fi


for file in "$@"; do
  OUTPUT=$(pluto detect "${file}")

  # shellcheck disable=SC2181
  if [[ $? -ne 0 ]]; then
    echo
    echo "==> file: ${file}"
    echo "${OUTPUT}"
  fi
done

exit 1
