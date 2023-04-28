# include the include -
include("Include.jl")

include("testme-datafile-load.jl")

# set parameters that are *constant* for all contracts -
B = 365.0       # Days in a year (all values are per year)
DTE = 51.0      # Days to expiration (DTE)
μ = 0.0352      # risk free rate: https://www.cnbc.com/quotes/US10Y
L = 100;        # number of levels on the tree
ticker = "AMD"  # let's look at AMD contracts

# TODO impl a test simulation and compare results with midpoint values

premium_array = Array{Float64,1}()

for i in eachindex(data)
    local Sₒ = data[i]["underlying_asset"]["price"]
    local IV = data[i]["implied_volatility"]
    local σₘ = (IV/1.0)


    local model = build(MyAdjacencyBasedCRREquityPriceTree, μ = μ, σ = σₘ, T = (DTE/365.0), h = L, Sₒ = Sₒ)

    if (data[i]["details"]["contract_type"] == "put")
            
        put_contract_model = build(MyPutContractModel,(
            ticker = data[i]["underlying_asset"]["ticker"],
            strike_price = 70.0,
            direction = 1,
            premium = 0.0, # we are computing this, set tmp value 0.0
            expiration_date = nothing,
            number_of_contracts = 1,
            current_price = Sₒ
        ));
        local put_premium_value = premium(put_contract_model, model)
        push!(premium_array, put_premium_value)
    else
        call_contract_model = build(MyCallContractModel,(
            ticker = data[i]["underlying_asset"]["ticker"],
            strike_price = 70.0,
            direction = 1,
            premium = 0.0, # we are computing this, set tmp value 0.0
            expiration_date = nothing,
            number_of_contracts = 1,
            current_price = Sₒ
        ))
        local call_premium_value = premium(call_contract_model, model)
        push!(premium_array, call_premium_value)

    end

end

premium_array
