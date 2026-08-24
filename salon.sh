#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICE_MENU() {
  # print return message if applicable
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi
  # ask for available service
  echo -e "Please Select one of our serices:\n"
  $PSQL "SELECT * FROM services;" | sed -e 's/|/) /g'
  read SERVICE_ID_SELECTED
  # check service name and validity
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
  if [[ -z $SERVICE_NAME ]]
  then
    SERVICE_MENU "Invalid service id $SERVICE_ID_SELECTED selected. Please choose one of the offered services"
  else
    # ask for phone
    echo "Please tell me your phone number:"
    read CUSTOMER_PHONE
    # check if already customer
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    if [[ -z $CUSTOMER_ID ]]
    then
      # ask new customer name
      echo -e "\nLooks like you're a first time customer, what is your name?\n"
      read CUSTOMER_NAME
      # add new customer
      $PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE');"
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")
      echo -e "\nWelcome back $CUSTOMER_NAME"
    fi
    # ask for the time
    echo -e "\nAt what time would you like to have the appointment for a $SERVICE_NAME?\n"
    read SERVICE_TIME
    # add appointment
    APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
    # thank you message
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
  fi
}

SERVICE_MENU