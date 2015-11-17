module H2O

#Right now, development is progressing assuming the pip install h2o has already taken place
#Something like the following would need to occur, although conda doesn't fall back on pip for installation:
#Conda.add("h2o")

using PyCall, JSON
import Requests: get, put, readall
@pyimport h2o



#global vars
export H2Oip, H2Oport

#types
export ClusterInfo

#functions
export clusterinfo, createframe

#Type files
include("types/clusterinfo.jl")

#Function files
include("cluster.jl")
include("data.jl")

end # module
