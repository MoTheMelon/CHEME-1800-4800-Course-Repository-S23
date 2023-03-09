include("Include.jl")

# path -
path_to_test_file = joinpath(_PATH_TO_DATA, "Test.net")

# load reaction dictionary -
reactions = readreactionfile(path_to_test_file)

# matrix = [1.0 2.1 ; 3.3 4.1]
# A = rand(2,2)
# vector = [2.2,2]
# println(A)

# multiply(A, vector, right=true)

A = rand(4,4)
B = rand(4,4)

multiply(A,B)
# Step 1: Build an instance of MyStoichiometricNetworkModel
# ...

# Step 2: Compute the binary version of the stoichiometric array (S̄)
# ...

# Step 3: Compute the S̄*transpose(S̄)
# ...