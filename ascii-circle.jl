r = try
    parse(Int,ARGS[begin])
  catch
    error("First arg is required and must be an integer")
end

wh_ratio = 8//15 # a guess

h = 2r
w = h // wh_ratio
origin = (h//2, w//2)
x_origin, y_origin = origin

is_in_circle(x::Number, y::Number) = begin
  d = √(((x_origin - x)//wh_ratio)^2 + (y_origin - y)^2)
  d ≤ r
end

for x = 1:h
  for y = 1:w
    if is_in_circle(x, y)
      print('o')
    else
      print('.')
    end
  end
  println()
end
