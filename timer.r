library(tictoc)

# Time original solution
tic("Original Script")
source("scripts/original.r")
original_time <- toc()

# Time solution with parallel loop
tic("Parallel Loop Script")
source("scripts/parallel_loop.r")
parallel_loop_time <- toc()

# Time solution with parallel function
tic("Parallel Function Script")
source("scripts/parallel_function.r")
parallel_function_time <- toc()

# Create data frame with results
results <- data.frame(File = c("solution_original.r", "solution_parallel_loop.r", "solution_parallel_function.r"),
                         Seconds = c(original_time$toc - original_time$tic,
                                     parallel_loop_time$toc - parallel_loop_time$tic,
                                     parallel_function_time$toc - parallel_function_time$tic))

# ------------------------------------------------------------------------

#Analysis:
#Initial Approach: The preliminary script processed tasks sequentially, lacking 
#any parallel processing, which led to longer execution times.

#Loop Parallelism: By parallelizing the primary loop that cycles through various
#values of N, this method showed an improvement in speed. Yet, the M 
#simulations for each N were still processed in a linear fashion, explaining 
#its enhanced but not optimal speed.

#Function-Level Parallelism: This variant stands out as the most efficient. It 
#amplifies speed by concurrently processing the M simulations within the 
#`MTweedieTests_parallel` function. However, the overarching loop, which steps 
#through different N values, continues to run sequentially.

#Insight: The most time-consuming segment, the M simulations inside the 
#function, was targeted for parallelization in the fastest solution, leading to its 
#superior performance.



.