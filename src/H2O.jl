module h2o
  #Right now, development is progressing assuming H2O cluster is started externally

  using JSON
  import Requests: get, put, post, readall

  #global vars
  export H2Oip, H2Oport

  #types
  export ClusterInfo

  #functions
  #not exporting functions by convention at this point

  #Type files
  include("types/clusterinfo.jl")

  #Function files
  include("cluster.jl")
  include("helpers.jl")
  include("createframe.jl")

end # module
