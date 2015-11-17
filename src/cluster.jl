#Assumes cluster started elsewhere
#register global variables so that host and ip are available elsewhere
function init(; ip::AbstractString = "localhost", port::Int = 54321)

	global H2Oip = ip
	global H2Oport = port

	return nothing

end

#Shut down a cluster
#Prompt set to false because prompt doesn't show up in Jupyter Notebook
#Using PyCall here to punt on re-writing the logic for time being
#shutdown(;conn = nothing, prompt::Bool = false) = h2o.shutdown(conn = conn, prompt = prompt)


#Return cluster info (after you've started the cluster)
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
