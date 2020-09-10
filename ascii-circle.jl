r = try
    parse(Int,ARGS[begin])
  catch
    error("First arg is required and must be an integer")
end

println("radius:", r)
