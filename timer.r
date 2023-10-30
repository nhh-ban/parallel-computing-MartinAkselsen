#
# TIMER
#

library(tictoc)

# Source the methods
source("scripts/original.r")
source("scripts/parallel_loop.r")
source("scripts/parallel_function.r")

# Original Method
tic("Original Method")
method_original()
toc()

# Parallel Loop Method
tic("Parallel Loop Method")
method_parallel_loop()
toc()

# Parallel Function Method
tic("Parallel Function Method")
method_parallel_function()
toc()
