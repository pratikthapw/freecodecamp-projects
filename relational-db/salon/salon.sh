#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\nWelcome to My Salon, how can I help you?:\n"

SHOW_SERVICES () {
  SERVICES_LIST="$($PSQL "select * from services")"
  echo "$SERVICES_LIST" | while IFS="|" read SERVICE_ID NAME
  do
  echo "$SERVICE_ID) $NAME"
  done
  CHOOSE_SERVICE
}

CHOOSE_SERVICE () {
  echo -e "\nChoose service to start:"
  read SERVICE_ID_SELECTED
  FIND_SERVICE=$(GET_SERVICE $SERVICE_ID_SELECTED)
  # FIND_SERVICE="$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")"
  if [[ -z $FIND_SERVICE ]]
  then
  echo -e "\nCouldn't find that service. Choose from here\n"
  SHOW_SERVICES
  else 
  INSERT_CUSTOMER $SERVICE_ID_SELECTED
  fi
}

INSERT_CUSTOMER () {
  SERVICE_ID=$1
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  FIND_NAME="$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")"
  if [[ -z $FIND_NAME ]]
  then
  echo -e "\nNo record found for that phone-number, what's your name?"
  read CUSTOMER_NAME
  ADD_CUSTOMER="$($PSQL "insert into customers(name, phone) values('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")"
  READ_TIME
  read SERVICE_TIME
  CUSTOMER_ID=$(GET_CUSTOMER_ID $CUSTOMER_PHONE)
  INSERT_APPOINTMENT $CUSTOMER_ID $SERVICE_ID $SERVICE_TIME
  else 
  READ_TIME
  read SERVICE_TIME
  CUSTOMER_ID=$(GET_CUSTOMER_ID $CUSTOMER_PHONE)
  INSERT_APPOINTMENT $CUSTOMER_ID $SERVICE_ID $SERVICE_TIME
  fi
}

INSERT_APPOINTMENT () {
  CUSTOMER_ID=$1
  SERVICE_ID=$2
  TIME=$3
  ADD_APPOINTMENT="$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID, '$TIME')")"
  if [[ $ADD_APPOINTMENT ]] 
  then
  SERVICE=$(GET_SERVICE $SERVICE_ID)
  CUSTOMER="$($PSQL "select name from customers where customer_id = $CUSTOMER_ID")"
  EXIT "$SERVICE" $TIME $CUSTOMER
  fi
}

READ_TIME () {
  echo -e "\nWhat time for the service?"
}

GET_CUSTOMER_ID () {
  PHONE=$1
  CUSTOMER_ID="$($PSQL "select customer_id from customers where phone = '$PHONE'")"
  echo $CUSTOMER_ID
}

GET_SERVICE () {
  SERVICE_ID=$1
  FIND_SERVICE="$($PSQL "select name from services where service_id = $SERVICE_ID")"
  echo "$FIND_SERVICE"
}

EXIT () {
  SERVICE=$1
  TIME=$2
  NAME=$3
  echo "I have put you down for a $SERVICE at $TIME, $NAME."
}

SHOW_SERVICES

