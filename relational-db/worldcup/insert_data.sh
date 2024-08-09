#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != year ]] 
then
# get winner and opponent 
WINNER_TEAM=$($PSQL "select name from teams where name = '$WINNER'")
#if not found
if [[ -z $WINNER_TEAM ]] 
then
INSERT_WINNER_TEAM=$($PSQL "insert into teams(name) values('$WINNER')")
fi

OPPONENT_TEAM=$($PSQL "select name from teams where name = '$OPPONENT'")
#if not found
if [[ -z $OPPONENT_TEAM ]] 
then
INSERT_TEAM=$($PSQL "insert into teams(name) values('$OPPONENT')")
fi
WINNER_TEAM_ID=$($PSQL "select team_id from teams where name = '$WINNER'")
OPPONENT_TEAM_ID=$($PSQL "select team_id from teams where name = '$OPPONENT'")

INSERT_GAME=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values($YEAR, '$ROUND', $WINNER_TEAM_ID,$OPPONENT_TEAM_ID, $WINNER_GOALS, $OPPONENT_GOALS)")

fi
done