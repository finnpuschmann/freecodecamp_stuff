#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

RANDOM_NUMBER=$(( $RANDOM % 1000 + 1 ))
#echo $RANDOM_NUMBER

echo "Enter your username:"
read USERNAME

# check if existing user
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
if [[ -z $USER_ID ]] # doesn't exist
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # create user in db
  ADD_USER_RESULT=$($PSQL "INSERT INTO users (username) VALUES('$USERNAME');")
  GAMES_PLAYED=0
  BEST_GAME=1000
else # user exists
  # get number of games played and pb
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$USERNAME';")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME';")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# regular expression for checking if number between 1-1000
re='^([1-9][0-9]{0,2}|1000)$'
NUM_GUESSES=0 # init guess counter

# ask first time
echo "Guess the secret number between 1 and 1000:"
# loop until guessed correctly
while true 
do
  read GUESS
  (( NUM_GUESSES++ )) # increase guess count
  # check validty of guess with reg-ex
  if [[ $GUESS =~ $re ]] # valid guess
  then
    if [[ $GUESS -eq $RANDOM_NUMBER ]] # correct guess
    then
      echo "You guessed it in $NUM_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      (( GAMES_PLAYED++ )) # increase games played
      # check if pb
      if [[ $NUM_GUESSES -lt $BEST_GAME ]]
      then
        BEST_GAME=$NUM_GUESSES
        # echo "New PB: $NUM_GUESSES guesses"
      fi
      # update db
      GAME_RESULT=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME';")
      break

    elif [[ $GUESS -lt $RANDOM_NUMBER ]] # too low
    then
      echo "It's higher than that, guess again:"
    else # too high
      echo "It's lower than that, guess again:"
    fi

  else # failed validity check
    echo "That is not an integer, guess again:"
  fi
done
