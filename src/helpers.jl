# helper functions

function h2o_get(endpoint::AbstractString, args...; version = 3)
    url = "http://$(H2Oip):$(H2Oport)/$(version)/$(endpoint)"

    if !isempty(args)
        url = string(url, "?")
        for i in args
            url = string(url, i, "&")
        end
            url = url[1:end-1]
    end

    println("h2o_get: ", url, "\n")  # for debugging, remove later

    results = get(url)
    return results
end


function h2o_post(endpoint::AbstractString, args...; version = 3)
    url = "http://$(H2Oip):$(H2Oport)/$(version)/$(endpoint)"

    if !isempty(args)
        url = string(url, "?")
        for i in args
            url = string(url, i, "&")
        end
        url = url[1:end-1]
    end

    println("h2o_post: ", url, "\n")   # for debugging, remove later

    results = post(url)
    return results
end
