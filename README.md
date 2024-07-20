# tic-tac-toe
Learning ruby via implementation of a simple tic tac toe game

There are areas of improvements left that needs to be integrated into the game:
1. Game does not end in a draw state
2. Logic bug where random inputs from get_move would randomly assign
    marker on the board
3. A marker can overwrite another marker that is already on the
    specific coordinate
4. When receiving marker representation from player, it does not catch
    exception if player enters a character other than X or O