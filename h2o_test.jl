include("src/H2O.jl")
using h2o



h2o.init()

h2o.clusterinfo()

h2o.get("Cloud")
