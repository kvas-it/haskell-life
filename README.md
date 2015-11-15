# Game of Life

Third attempt at writing a Conway's Game of Life in Haskell after running out
of time in a code retreat session and succeeding but not very beautifully by
myself afterwards. This one is probably still pretty far from perfection, but
it seems decent. 

The position is represented here as a HashSet of points where living cells
are located. Theoretically this should give us linear performance because
checking set membership is O(1), and the number of candidates is < 9 x N
where N is number of points in current generation.

Note: the list of candidates now would not include existing points that have
no alive neighbours. This could potentially be a problem, but it's not because
cells with no neighbours die in the next generation anyway.
