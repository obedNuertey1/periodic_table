#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -t --no-align -c"

#If input is a letter
if [[ $1 =~ ^[A-Za-z]{1,2}$ ]]
then
	#check whether it's an element symbol
	SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1'")
	if [[ -z $SYMBOL ]]
	then
		echo "I could not find that element in the database."
	else
		
		ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")

		NAME=$($PSQL "SELECT name FROM elements WHERE symbol='$1'")

		TYPE=$($PSQL "SELECT type FROM types LEFT JOIN properties USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")

		MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

		MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

		BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

		echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
	fi
#else if input is a number
elif [[ $1 =~ [0-9]+ ]]
then
	#check whether its atomic number exists
	
	ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
	if [[ -z $ATOMIC_NUMBER ]]
	then
		echo "I could not find that element in the database."
	else
		NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number='$1'")

		TYPE=$($PSQL "SELECT type FROM types LEFT JOIN properties USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")

		MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

		MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

		BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

		SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")

		echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
	fi
#else if input is a word
elif [[ $1 =~ [a-z]+ ]]
then
	#check whether the word is the name of an element
	NAME=$($PSQL "SELECT name FROM elements WHERE name='$1'")
	if [[ -z $NAME ]]
	then
		echo "I could not find that element in the database."
	else

		SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$NAME'")
		
		ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$NAME'")

		TYPE=$($PSQL "SELECT type FROM types LEFT JOIN properties USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")

		MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

		MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

		BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

		echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
	fi
elif [[ -z $1 ]]
then
	echo "Please provide an element as an argument."
fi