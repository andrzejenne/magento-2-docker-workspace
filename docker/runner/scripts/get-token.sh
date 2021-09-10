#!/bin/bash

CONFIG="/tmp/get-token.vars"
if [ -f "$CONFIG" ]
then
# spellcheck source=/tmp/get-token.vars
  . "$CONFIG"
  echo "Loaded $CONFIG"
  echo "$USERNAME:$TYPE:$URL"
fi;


if [ ! -z "$1" ]
then
  TYPE="$1" # customer
else
  if [ -z "$TYPE" ]
  then
    TYPE="admin"
  fi
fi

if [ ! -z "$2" ]
then
  URL="$2"
else
  if [ -z "$URL" ]
  then
    URL="http://localhost"
  fi
fi

echo "Username:"
if [ ! -z "$USERNAME" ]
then
  echo "($USERNAME)"
fi
read USERNAME_TYPED
if [ ! -z "$USERNAME_TYPED" ]
then
  USERNAME="$USERNAME_TYPED"
fi

echo "Password:"
if [ ! -z "$PASSWORD" ]
then
  echo "(*****)"
fi
read -s PASSWORD_TYPED
if [ ! -z "$PASSWORD_TYPED" ]
then
  PASSWORD="$PASSWORD_TYPED"
fi

curl -X POST "$URL/rest/V1/integration/$TYPE/token" -H "Content-Type: application/json" -d "{\"username\": \"$USERNAME\", \"password\": \"$PASSWORD\" }"

echo "
TYPE=\"$TYPE\"
URL=\"$URL\"
USERNAME=\"$USERNAME\"
PASSWORD=\"$PASSWORD\"
" > "$CONFIG"
