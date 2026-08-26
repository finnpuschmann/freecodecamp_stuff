If your solution doesn't pass:

If that username has been used before, it should print Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses., with <username> being a users name from the database, <games_played> being the total number of games that user has played, and <best_game> being the fewest number of guesses it took that user to win the game

and 

When the secret number is guessed, your script should print You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job! and finish running

test, but it works correctly as far as you can tell:

try moving the 
  echo "Guess the secret number between 1 and 1000:"
outside of the loop, only ask it once per game

ALSO you need to count invalid (not an integer) guesses as well

ALSO you need to catch larger 1001+ and also display not an integer message (even if they are ints)
