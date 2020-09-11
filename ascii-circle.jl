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

get_char(x::Number, y::Number) = begin
  d = √((x_origin - x)^2 + ((y_origin - y) * wh_ratio)^2)
  d = Int(floor(d))
  d = d + 1 # treat distance as slightly larger for better edge rendering
  if d < r
    'o'
  elseif d == r
    θorigin = atan((y_origin - y)//(x_origin - x))
    θedge = π/2 + θorigin # 0 to π
    if π/8 ≤ θedge < 3π/8
      '\\'
    elseif 3π/8 ≤ θedge ≤ 5π/8
      '-'
    elseif 5π/8 < θedge ≤ 7π/8
      '/'
    else
      '|'
    end
  else
    '.'
  end
end

for x = 1:h
  for y = 1:w
    print(get_char(x,y))
  end
  println()
end
