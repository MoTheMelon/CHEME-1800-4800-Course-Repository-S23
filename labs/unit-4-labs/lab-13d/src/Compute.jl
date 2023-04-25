"""
    solve(model::MyCRRPriceLatticeModel, Sₒ::Float64, T::Int) -> Dict{Int,Array{NamedTuple,1}}
"""
function solve(model::MyCRRPriceLatticeModel, Sₒ::Float64, T::Int)::Dict{Int,Array{NamedTuple,1}}

    # initialize -
    u = model.u;
    p = model.p;
    d = 1/u; # this the CRR assumption
    results = Dict{Int,Array{NamedTuple,1}}() # the named tuple holds two pieces of data: S is the price, P is the probability of that price
    #Int (Tree Level) => Array{NamedTuple,1} [S,P]
    #0 (t=0) => [(So, 1)] 1 named tuple
    #1 (t=1) => [(St,0.51),(St,0.49)]

    #initial case
    results[0] = [(S = Sₒ, P = 1)]

    for t in 1:T
        price_array = Array{NamedTuple,1}()
        for k in 0:t
            list = (S = Sₒ*(u^k)*d^(t-k), P = binomial(t,k)*p^k*(1-p)^(t-k))
            push!(price_array, list)
        end
        results[t] = array
    end
                  
    # return -
    return results;
end

"""
    entropy(data::Dict{Int,Array{NamedTuple,1}}, level::Int) -> Float64
"""
function entropy(data::Dict{Int,Array{NamedTuple,1}}, level::Int)::Float64

    # initialize -
    H = 0.0;

    # Hint: to compute log to the base 2, check out the log2 method

    # TODO: implement entropy calculation
    prices = data[level]
    
    
    # return -
    return -1*H
end