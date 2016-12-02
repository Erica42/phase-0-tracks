# One user can enter a word (or phrase, if you would like your game to support that), and another user attempts to guess the word.
# Guesses are limited, and the number of guesses available is related to the length of the word.
# Repeated guesses do not count against the user.
# The guessing player receives continual feedback on the current state of the word. So if the secret word is "unicorn", the user will start out seeing something like "_ _ _ _ _ _ _", which would become "_ _ _ c _ _ _" after the user enters a guess of "c".
# The user should get a congratulatory message if they win, and a taunting message if they lose.

# when you start the game have a word, a guess counter set based on word?, and empty array of letters
# split word into letters
# print _ for each letter
# check that the guess hasn’t been guessed before
# check and see if a guess matches any of the letters in the word
# change _ to print the letter if correct
# enter the letter into a list of already guessed letters
# subtract one from the number of guesses

