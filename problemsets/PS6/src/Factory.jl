
"""
Fill me in.
"""
function _build_stoichiometric_matrix(data::Dict{String,Any})::Array{Float64,2}
    
    # initialize -
    list_of_metabolites = data["metabolites"];
    list_of_reactions = data["reactions"];
    number_of_reactions = length(list_of_reactions);
    number_of_metabolites = length(list_of_metabolites);
    S = Array{Float64,2}(undef, number_of_metabolites, number_of_reactions);
    
    # TODO: fill in the entries of the stochiometric matrix 
    # for i ∈ 1:number_of_metabolites

    #     metablite_dict = list_of_metabolites[i];
    #     key_id = metablite_dict["id"];

    #     for j ∈ 1:number_of_reactions

    #         reaction_dict = list_of_reactions[j];
    #         reaction_metabolites_dict = reaction_dict["metabolites"];
    #         if (haskey(reaction_metabolites_dict, key_id) == true)
    #             st_value = reaction_metabolites_dict[key_id];
    #             S[i,j] = st_value;
    #         else
    #             S[i,j] = 0.0;
    #         end
    #     end
    # end

    # fill w/zeros -
    fill!(S,0.0);

    # build the stochiometric matrix -
    for i ∈ 1:number_of_metabolites
        
        # get a metabolite -
        metabolite_id = list_of_metabolites[i]["id"]
        
        for j ∈ 1:number_of_reactions

            # grab the reaction object, and then metabolites dictionary -
            metabolite_dictionary = list_of_reactions[j]["metabolites"]
            if (haskey(metabolite_dictionary, metabolite_id) == true)
                S[i,j] = metabolite_dictionary[metabolite_id];
            end
        end
    end

    # return -
    return S
end

"""
Fill me in.
"""
function _build_metabolite_id_array(data::Dict{String,Any})::Array{String,1}

    # initialize -
    metabolite_id_array = Array{String,1}()

    # TODO: fill the metabolite_id_array with the metabolite id's from the data dictionary
    metabolites = data["metabolites"];
    for metabolite ∈ metabolites
        id_value = metabolite["id"];
        push!(metabolite_id_array, id_value);
    end

    # return -
    return metabolite_id_array;
end

"""
Fill me in.
"""
function _build_reaction_id_array(data::Dict{String,Any})::Array{String,1}
    
    # initialize -
    reaction_id_array = Array{String,1}()

    # TODO: fill the reaction_id_array with the reaction id's from the data dictionary
    reactions = data["reactions"];
    for reaction ∈ reactions
        id_value = reaction["id"]
        push!(reaction_id_array, id_value);
    end

    # return -
    return reaction_id_array;
end

"""
Fill me in.
"""
function _build_bounds_array(data::Dict{String,Any})::Array{Float64,2}

    # initialize -
    list_of_reactions = data["reactions"];
    number_of_reactions = length(list_of_reactions)
    bounds_array = Array{Float64,2}(undef,number_of_reactions,2)

    # TODO: fill in the entries of the bounds array, first col is the lower bound, second col is the upper bound
    for i ∈ 1:number_of_reactions
        reaction = list_of_reactions[i];
        L = reaction["lower_bound"];
        U = reaction["upper_bound"];
        bounds_array[i,1] = L
        bounds_array[i,2] = U
    end

    # return -
    return bounds_array
end

"""
Fill me in
"""
function build(type::Type{MyStoichiometricNetworkModel}, data::Dict{String,Any})::MyStoichiometricNetworkModel

    # build an empty instance of our model -
    model = MyStoichiometricNetworkModel();

    # construct model elements -
    model.species = _build_metabolite_id_array(data);
    model.reactions = _build_reaction_id_array(data);
    model.bounds = _build_bounds_array(data);
    model.S = _build_stoichiometric_matrix(data);

    # return -
    return model;
end