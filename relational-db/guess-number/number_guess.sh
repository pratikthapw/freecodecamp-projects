#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


GET_USER_ID () {
  USERNAME=$1;
  USER_ID="$($PSQL "select user_id from users where username = '$USERNAME'")";
  echo $USER_ID
}

GET_USERNAME () {
  echo -e "Enter your username:";
  read USERNAME;
  USER_ID=$(GET_USER_ID $USERNAME);
  if [[ -z $USER_ID ]] 
  then
  ADD_USER $USERNAME;
  USER_ID=$(GET_USER_ID $USERNAME);
  GENERATE_RANDOM_NUMBER $USER_ID;
  GUESS_SECRET_NUMBER $USER_ID;
  else 
  USER_EXIST $USER_ID;
  GENERATE_RANDOM_NUMBER $USER_ID;
  GUESS_SECRET_NUMBER $USER_ID;
  fi
}

ADD_USER () {
  USERNAME=$1;
  INSERT_USER="$($PSQL "insert into users(username) values('$USERNAME')")";
  if [[ INSERT_USER ]]
  then
  echo "Welcome, $USERNAME! It looks like this is your first time here.";
  fi
}

USER_EXIST () {
  USER_ID=$1;
  RESPONSE="$($PSQL "select * from users full join games using (user_id) where user_id = $USER_ID")";
  echo $RESPONSE | while IFS="|" read ID USERNAME GAMES_PLAYED BEST_GUESS CURR_GUESS RANDOM_NUMBER
  do
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses.";
  done
}


GENERATE_RANDOM_NUMBER () {
  USER_ID=$1
  RANDOM_NUMBER=$(((RANDOM % 1000) + 1))
  UPDATE_RANDOM_NUMBER="$($PSQL "update games set random_number=$RANDOM_NUMBER where user_id=$USER_ID")"
  echo $RANDOM_NUMBER
}

GUESS_SECRET_NUMBER () {
  USER_ID=$1
  echo -e "Guess the secret number between 1 and 1000:"

  FIND_NUMBER="$($PSQL "select random_number from games where user_id=$USER_ID")"
  GUESS_TIMES=0
  while true; do
  ((GUESS_TIMES++));
    read SECRET_NUMBER

    if ! [[ "$SECRET_NUMBER" =~ ^-?[0-9]+$ ]]; then
      echo "That is not an integer, guess again:"
      continue
    fi

    SECRET_NUMBER=$((SECRET_NUMBER))

    if [[ "$SECRET_NUMBER" -lt "$FIND_NUMBER" ]]; then
      echo "It's lower than that, guess again:"
    elif [[ "$SECRET_NUMBER" -gt "$FIND_NUMBER" ]]; then
      echo "It's higher than that, guess again:"
    else
      BEST_GUESS="$($PSQL "select best_guess from games where user_id = $USER_ID")";
      if [[ $BEST_GUESS == 0 || $BEST_GUESS > $GUESS_TIMES ]]
      then
      UPDATE_GAMES="$($PSQL "update games set best_guess = $GUESS_TIMES, games_played = games_played + 1 where user_id = $USER_ID")";
      else
      UPDATE_GAMES="$($PSQL "update games set games_played = games_played + 1 where user_id = $USER_ID")";
      fi
      echo "You guessed it in $GUESS_TIMES tries. The secret number was $FIND_NUMBER. Nice job!"
      break;
    fi
  done
}

GET_USERNAME