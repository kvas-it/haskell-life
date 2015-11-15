# Game of Life

Third attempt at writing a Conway's Game of Life in Haskell after running out
of time in a code retreat session and succeeding but not very beautifully by
myself afterwards. This one is probably still pretty far from perfection, but
it seems decent. 

Note: the position is represented here as a list of positions of living cells.
This is simple, but gives multiple different representations for the same
position. However, the result of ``nextGeneration`` is always sorted so it will
always have the same order of points for the same position.
