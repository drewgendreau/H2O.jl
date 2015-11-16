type ClusterInfo
	meta::Dict
	locked::Bool
	cloudname::AbstractString
	skipticks::Bool
	version::AbstractString
	cloudsize::Int
	healthy::Bool
	badnodes::Int
	excludefields::AbstractString
	nodes::Vector
	clouduptimemillis::Int
	nodeidx::Int
	consensus::Bool
	isclient::Bool
end