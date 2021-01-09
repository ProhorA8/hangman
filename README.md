Material from Wikipedia - 
free encyclopedia ["Hangman game"](https://ru.wikipedia.org/wiki/Виселица_(игра))

### Installation
```
$ git clone git@github.com:ProhorA8/hangman.git

$ cd ./hangman

$ gem install bundler

$ bundle
```
### Run game:
```
$ bundle exec ruby main.rb
```
The computer thinks out a word and displays it on the screen.

The player has 7 attempts to guess, with each error the current state of the player on the gallows is shown. 

Upon reaching 7 errors, the player loses and is hanged.

### Adding new words to the game

You need to go to ```/data/word.txt``` and add the necessary words.
