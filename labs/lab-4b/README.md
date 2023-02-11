## Lab-4b: Analysis of the Recursive Quick Sort Algorithm

### Objectives
The objective of `lab-4b` is to familiarize students with recursion, the divide and conquer paradigm, and their use for useful tasks such as sorting. 
Unlike the previous sorting approaches we explored, e.g., [Bubble sort](https://www.youtube.com/watch?v=uJLwnsLn0_Q), [Quicksort](https://en.wikipedia.org/wiki/Quicksort) uses recursion to sort lists.

### Algorithm
[Quicksort](https://en.wikipedia.org/wiki/Quicksort) is an efficient, general-purpose recursive sorting algorithm for arrays originally [published in 1961](https://doi.org/10.1145/366622.366644). Quicksort uses a divide-and-conquer paradigm in which a `pivot` element is selected from the array; then, the array is partitioned into two subarrays containing smaller and larger elements than the pivot element (the divide step). Finally, each subarray is then recursively sorted (the conquer step).



### Tasks
1. Break up into groups and explain/analyze the [Quicksort](https://en.wikipedia.org/wiki/Quicksort) implementation in `QuickSort.jl`. 
1. Sort a set of random vectors of length `l = 2, 4, 8, 16, 32, 64, 128, 256` created using the `rand()` command. Record the mean and standard deviation of the execution time for the `quicksort` implementation as a function of the array’s length using the [BenchmarkTools](https://github.com/JuliaCI/BenchmarkTools.jl) package. 

