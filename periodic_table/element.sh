#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
then
  # check if passed arg $1 is a number with reg-ex
  re='^[0-9]+$'
  if [[ $1 =~ $re ]] # all numbers -> check atomic_number
  then
    # try as atomic number
    RESULT=$($PSQL "SELECT * FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number=$1;")
  else
    # try with symbol or name
    RESULT=$($PSQL "SELECT * FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number JOIN types ON properties.type_id=types.type_id WHERE symbol='$1' OR name='$1';")
  fi
  if [[ -z $RESULT ]] # doesn't exist
  then
    echo "I could not find that element in the database."
  else # exists and extract relevant info
    IFS='|' read -r ATOMIC_NUMBER SYMBOL NAME ATOMIC_NUMBER MASS MELT BOIL TYPE_ID TYPE_ID TYPE <<< "$RESULT"
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  fi
else
  # no arg given
  echo "Please provide an element as an argument."
fi