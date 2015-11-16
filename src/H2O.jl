module H2O

#Right now, development is progressing assuming the pip install h2o has already taken place
#Something like the following would need to occur, although conda doesn't fall back on pip for installation:
#Conda.add("h2o")

using PyCall, Conda, Requests, JSON
@pyimport h2o

import Requests: get

#global vars
export H2Oip, H2Oport

#types
export ClusterInfo

#functions
export clusterinfo

#Type files
include("types/clusterinfo.jl")

#Function files
include("cluster.jl")

end # module
