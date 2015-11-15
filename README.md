# Game of Life

Third attempt at writing a Conway's Game of Life in Haskell after running out
of time in a code retreat session and succeeding but not very beautifully by
myself afterwards. This one is probably still pretty far from perfection, but
it seems decent. 

The position is represented here as a list of points where living cells
are located. This is simple, but gives multiple different representations for
the same position. However, the result of ``nextGeneration`` is always sorted
so it will always have the same order of points for the same position.

Also time complexity of ``nextGeneration`` here is quadratic, which is not
great as linear algorithm seems possible with using hashmaps and neighbour
marking. Functional version of that would probably also be possible with
``HashMap``.
