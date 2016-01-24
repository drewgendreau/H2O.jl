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

	results = geth2o("Cloud", "skip_ticks=true")
	result_json = JSON.parse(readall(results))

	return result_json

end
