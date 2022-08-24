#!/bin/bash

if ! which pluto > /dev/null 2>&1; then
  echo "Please install pluto: https://pluto.docs.fairwinds.com/installation/"
  exit 1
fi

for file in "$@"; do
  OUTPUT=$(pluto detect "${file}")

  # shellcheck disable=SC2181
  if [[ $? -ne 0 ]]; then
    ERROR_OCCURED="true"
    echo
    echo "==> file: ${file}"
    echo "${OUTPUT}"
  fi
done

if [[ "${ERROR_OCCURED}" == "true" ]]; then
  exit 1
fi
