#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi
# echo "$PSQL"

# Do not change code above this line. Use the PSQL variable above to query your database.

# start with clean sheet
psql --username=postgres -t --no-align -c "DROP DATABASE worldcup";
psql --username=postgres -t --no-align -c "CREATE DATABASE worldcup";

CREATE_TEAMS_TABLE=$($PSQL "CREATE TABLE teams(team_id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(40) NOT NULL UNIQUE);")

CREATE_GAMES_TABLE=$($PSQL "CREATE TABLE games(game_id SERIAL NOT NULL PRIMARY KEY, year INT NOT NULL, round VARCHAR(40) NOT NULL, winner_goals INT NOT NULL, opponent_goals INT NOT NULL, winner_id INT NOT NULL REFERENCES teams(team_id), opponent_id INT NOT NULL REFERENCES teams(team_id));")

# Cycle through games.csv line by line
I=0
cat games.csv | while IFS=',' read -r -a row
do 
  # first row is description, not data
  if [[  $I == 0 ]]
  then
    echo 'skipping first line'
  else
    # extract variables year round winner winner_goals opponent_goals for each game
    YEAR=${row[0]}
    ROUND=${row[1]}
    WINNER=${row[2]}
    OPPONENT=${row[3]}
    WINNER_GOALS=${row[4]}
    OPPONENT_GOALS=${row[5]}
    # echo "$YEAR $ROUND $WINNER $WINNER_GOALS:$OPPONENT_GOALS"

    # get team_ids
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    # check if teams are in teams table
    if [[ -z $WINNER_ID ]]
    then
      # add winning team
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
      # echo "Inserted Team $WINNDER_ID: $WINNER"
      echo "$INSERT_WINNER_RESULT"
    fi
    if [[ -z $OPPONENT_ID ]]
    then
      # add opponent team
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
      # echo "Inserted Team $OPPONENT_ID: $OPPONENT"
      echo "$INSERT_WINNER_RESULT"
    fi
    # add game to games table
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
                                VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
    echo "$INSERT_GAME_RESULT"
  fi
  I=$(( $I + 1 ))
done