#!/bin/bash
#
# bad_dirs.sh: List incorrectly named directories

# list directories with spaces
spaces=$(find . -maxdepth 1 -type d -regex '.* .*' -print | sort)
if [[ -n $spaces ]]; then
  echo "Filenames with spaces:"
  echo "$spaces"
fi

unusual=$(find . -maxdepth 1 -type d -regex '\./.*[^-_a-zA-Z0-9 ].*' -print | sort)
if [[ -n $unusual ]]; then
  echo "Filenames with unusual characters:"
  echo "$unusual"
fi

missing=$(find . -maxdepth 1 -type d -regex '.*[a-z][A-Z].*' -print | sort)
if [[ -n $missing ]]; then
  echo "Filenames that might have incorrectly seperated names:"
  echo "$missing"
fi

renamed=$(find . -maxdepth 1 -type d -regextype posix-extended -regex '(.* .*)|(\./.*[^-_a-zA-Z0-9 ].*)' -print | sort)
if [[ -n $renamed ]]; then
  echo "Directories that should be renamed:"
  echo "$renamed"
fi