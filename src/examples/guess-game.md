# Guessing Game

A simple guessing game.


```zuri
import io { readline }

echo '== Guess the number =='

while true {
  print('\nGuess a number from 0 to 100: ')

  var secret = rand(1, 100)
  var guess = to_number(readline())

  if guess > secret echo '\nYou guessed too big!'
  else if guess < secret echo '\nYou guessed small!'
  else echo '\nYou guessed right.'

  echo 'The secret number was ${secret}'

  var try_again = false
  print("\nDo you want to try again? Enter 'y' for yes: ")

  if readline() != 'y' break
}

echo '\nGoodbye!'
```