#Create random data frame
#Wrap Python code, until figure out API call
function createframe(; id::Union{AbstractString, Void} = nothing, rows::Int = 10000,
					cols::Int = 10, randomize::Bool = true, value::Real = 0, realrange::Real = 100,
					categoricalfraction::Real = 0.2, factors::Int = 100, integerfraction::Real = 0.2,
					integerrange::Real = 100, binaryfraction::Real = 0.1, binaryonesfraction::Real = 0.02,
					missingfraction::Real = 0.01, responsefactors::Int = 2, hasresponse::Bool = false,
					seed::Union{Int, Void} = nothing)
    return h2o.create_frame(id = id, rows = rows, cols = cols, randomize = randomize, value = value, real_range = realrange, categorical_fraction = categoricalfraction, factors = factors, integer_fraction = integerfraction, integer_range = integerrange, binary_fraction = binaryfraction, binary_ones_fraction = binaryonesfraction, missing_fraction = missingfraction, response_factors = responsefactors, has_response = hasresponse, seed = seed)
end