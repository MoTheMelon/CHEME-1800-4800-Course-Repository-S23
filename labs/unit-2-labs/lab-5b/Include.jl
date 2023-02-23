# setup paths
const _ROOT = pwd()
const _PATH_TO_SRC = joinpath(_ROOT, "src")
const _PATH_TO_DATA = joinpath(_ROOT, "data")

# load external packages -
using DataStructures # we need this for the Queue data structure

# load my codes -
"""
Types: initializes reaction object with attributes Name, reaction, and product
Factory: function that creates a model for strings to be assigned to their respective attributes of the reaction
Files: function to read the reaction file and output a dict with the reaction name as the key and the reactants and products as the value
Parser:
"""
include(joinpath(_PATH_TO_SRC, "Types.jl"))
include(joinpath(_PATH_TO_SRC, "Factory.jl"))
include(joinpath(_PATH_TO_SRC, "Files.jl"))
include(joinpath(_PATH_TO_SRC, "Parser.jl"))