#!/bin/bash

POSITIONAL=()
RCNAME='.bashrc'

while [[ $# -gt 0 ]]
do
  key="$1"

  case $key in
    -g|--groupname)
    GROUPNAME="$2"
    shift
    shift
    ;;
    -r|--rcname)
    RCNAME="$2"
    shift
    shift
    ;;
    -z|--zbase)
    ZSHBASE="$2"
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

components=()

if [ -n "$ZSHBASE" ]; then
  components+=("$ZSHBASE")
fi
components+=("base_profile")

if [ -n "$GROUPNAME" ]; then
  components+=("$GROUPNAME")
fi
echo "merging profiles: ${components[@]}"
cat "${components[@]}" > "$RCNAME"

echo 'symlinking dotfiles:'
for file in `find . -name ".*" | sed 's|./||'`; do
  if [ "$file" == '.git' ] || [ "$file" == '.' ]; then
    continue
  fi

  echo $file
  ln -sf "$(pwd)/$file" ~/$file
done

source $RCNAME
