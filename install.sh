#!/bin/bash

POSITIONAL=()
RCNAME='.bashrc'

while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -a|--avant)
    AVANTZSH="true"
    shift
    ;;
    -r|--rcname)
    RCNAME="$2"
    shift
    shift
    ;;
    *)
    POSITIONAL+=("$1") # save it in an array for later
    shift
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

components=(aliases)
next=`expr ${#components[@]} + 1`


if [ -n "$AVANTZSH" ]; then
  components[next]=avant_aliases
fi

cat "${components[@]}" > "$RCNAME"

echo 'symlinking dotfiles:'
for file in `find . -name ".*" | sed 's|./||'`; do
  if [ "$file" == '.git' ] || [ "$file" == '.' ]; then
    continue
  fi

  echo $file
  ln -sf "$(pwd)/$file" ~/$file
done
