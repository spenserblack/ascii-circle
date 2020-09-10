r = try
    parse(Int,ARGS[begin])
  catch
    error("First arg is required and must be an integer")
end

h = 2r
w = 2h # width is double height due to size of monospace characters
origin = (h//2, w//2)
x_origin, y_origin = origin

is_in_circle(x::Int, y::Int) = begin
  d = √(((x_origin - x)^2)*2 + (y_origin - y)^2)
  d ≤ r
end

for x = 1:h
  for y = 1:w
    if is_in_circle(x, y)
      print('o')
    else
      print(' ')
    end
  end
  println()
end
