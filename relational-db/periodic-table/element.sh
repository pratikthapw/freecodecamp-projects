#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
ARGUMENT=$1

FIND_ELEMENT () {
  if [[ $ARGUMENT =~ ^[0-9]+$ ]]
  then
    ELEMENT="$($PSQL "select * from elements where atomic_number = $ARGUMENT")"
    ELEMENT_RETURN $ELEMENT
  else 
    ELEMENT="$($PSQL "select * from elements where symbol = '$ARGUMENT' or name = '$ARGUMENT'")"
    ELEMENT_RETURN $ELEMENT
  fi
}

ELEMENT_EXIST () {
  ATOMIC_NUMBER=$1
  QUERY="$($PSQL "select symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius from elements full join properties using(atomic_number) full join types using(type_id) where atomic_number = $ATOMIC_NUMBER")"
  echo $QUERY | while IFS="|" read SYMBOL NAME TYPE ATOMIC_MASS MELTING BOILING
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
  done
}

ELEMENT_RETURN () {
  RESULT=$1
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else 
    echo "$ELEMENT" | while IFS="|" read ATOMIC_NUMBER REST
    do
      ELEMENT_EXIST $ATOMIC_NUMBER
    done
  fi
}

if [[ -z $ARGUMENT ]]
then
  echo -e "Please provide an element as an argument."
else
  FIND_ELEMENT
fi


