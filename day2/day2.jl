include("../common.jl")

function get_final_position(input)
  coordinates = Dict{String, Int64}("z" => 0, "y" => 0)

  for movement in input
    vector = split(movement, " ")
    direction = vector[1]
    scalar = parse(Int, vector[2])

    if direction == "forward"
      coordinates["z"] += scalar
    elseif direction == "up"
      coordinates["y"] -= scalar
    elseif direction == "down"
      coordinates["y"] += scalar
    else
      throw(DomainError("unrecognized movement direction"))
    end
  end

  return coordinates
end

data = read_data("./day2/day2_data.txt")
final_position = get_final_position(data)
mult = final_position["z"] * final_position["y"]
println("Final Position: $final_position.")
println("Coordinates Multiplied: $mult")