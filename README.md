# Hex-paper TSP
Solving the traveling salesman problem to create hex paper.

## Creating a solution
Run `gap` and read the file `hex.gap` in the following manner

```shell
gap> Read("./hex.gap");
```

This will output to screen a set of points. It will also create two files, i.e.
`data.tsp` and `data.ps`.

With the `concorde` executable in your path, run

```shell
concorde data.tsp
```

to create a `data.sol` file. Use `data.ps` and `data.sol` to update the
`solution.ps` which will draw a nice picture of the tour.
