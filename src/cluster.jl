#Start a cluster, register global variables so that host and ip are available elsewhere
#Using PyCall here to punt on re-writing the logic for time being
function init(; ip::AbstractString = "localhost",
				port::Int = 54321,
				size::Union{Int, Void} = nothing,
				start_h2o::Union{Bool, Void} = nothing,
				enable_assertions::Union{Bool, Void} = nothing,
				license::Union{AbstractString, Void} = nothing,
				max_mem_size_GB::Int = 8,
				min_mem_size_GB::Int = 1,
				ice_root::Union{AbstractString, Void} = nothing,
				strict_version_check::Union{Bool, Void} = false
			)

	#Python call
	h2o.init(;
		ip = ip,
		port = port,
		size = size,
		start_h2o = start_h2o,
		enable_assertions = enable_assertions,
		license = license,
		max_mem_size_GB = max_mem_size_GB,
		min_mem_size_GB = min_mem_size_GB,
		ice_root = ice_root,
		strict_version_check = strict_version_check
		)

	global H2Oip = h2o.H2OConnection[:ip]()
	global H2Oport = h2o.H2OConnection[:port]()

	return nothing

end

#Shut down a cluster
#Prompt set to false because prompt doesn't show up in Jupyter Notebook
#Using PyCall here to punt on re-writing the logic for time being
shutdown(;conn = nothing, prompt::Bool = false) = h2o.shutdown(conn = conn, prompt = prompt)


#Return cluster info (after you've started the cluster)
#Native Julia
function clusterinfo()

	results = get("http://$(H2Oip):$(H2Oport)/3/Cloud?skip_ticks=true")
	result_json = JSON.parse(readall(results))

	return	ClusterInfo(
			result_json[:"__meta"],
			result_json[:"locked"],
			result_json[:"cloud_name"],
			result_json[:"skip_ticks"],
			result_json[:"version"],
			result_json[:"cloud_size"],
			result_json[:"cloud_healthy"],
			result_json[:"bad_nodes"],
			result_json[:"_exclude_fields"],
			result_json[:"nodes"],
			result_json[:"cloud_uptime_millis"],
			result_json[:"node_idx"],
			result_json[:"consensus"],
			result_json[:"is_client"]
			)

end
