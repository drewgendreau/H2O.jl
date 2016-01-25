# functions that return information about h2o

function frames()
    ## Retrieve all frames in the h2o cluster
    results = h2o_get("Frames")
	result_json = JSON.parse(readall(results))

    @printf "%-34s" "frame_id"
    @printf "%15s" "rows"
    @printf "%15s" "columns"
    @printf "%16s" "size (MB)\n"

    for i in 1:length(result_json["frames"])
        @printf "%-34s" result_json["frames"][i]["frame_id"]["name"]
        @printf "%15s" result_json["frames"][i]["rows"]
        @printf "%15s" result_json["frames"][i]["columns"]
        @printf "%15.2f" result_json["frames"][i]["byte_size"]/1000000
        @printf "MB\n"
    end

# need to decide later, as a whole for H2O.jl when we want to return
# results vs. just print
# perhaps bifurcate into two separate types of functions:

# list_frames(), which would simply print
# get_frames(), which would return a JSON object

#    return result_json

end
