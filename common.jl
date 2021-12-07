function read_data(file_name)
  io = open(file_name, "r")
  data = read(io, String)
  data = split(data, "\n")
  input = []

  for element in data
    push!(input, element)
  end

  return input
end
