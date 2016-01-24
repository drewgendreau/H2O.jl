# helper functions

function geth2o(endpoint::AbstractString, args...)

  url = "http://$(H2Oip):$(H2Oport)/3/$(endpoint)"

  if !isempty(args)
    url = string(url, "?")
    for i in args
      url = string(url, i, "&")
    end
    url = url[1:end-1]
  end

  results = get(url)

  return results

end


function posth2o(endpoint::AbstractString, args...)

  url = "http://$(H2Oip):$(H2Oport)/3/$(endpoint)"

  if !isempty(args)
    url = string(url, "?")
    for i in args
      url = string(url, i, "&")
    end
    url = url[1:end-1]
  end

  println(url)

  results = post(url)

  return results

end
