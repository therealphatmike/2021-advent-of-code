function did_depth_increment(previous, current)
  return current > previous
end

function get_number_of_depth_increments(input)
  previous_measurement = popfirst!(input)
  increment_depth_count = 0
  current_measurement = 0

  for depth in input
    current_measurement = depth

    if did_depth_increment(previous_measurement, current_measurement)
      increment_depth_count += 1
    end

    previous_measurement = current_measurement
  end

  return increment_depth_count
end

function read_data()
  io = open("day1_data.txt", "r")
  data = read(io, String)
  data = split(data, "\n")
  input = []

  for element in data
    push!(input, parse(Int64, element))
  end

  return input
end

function sum_measurement_tuples(input)
  sums_array = []
  first_measurement = popfirst!(input)
  second_measurement = popfirst!(input)

  for element in input
    third_measurement = element

    push!(sums_array, (first_measurement + second_measurement + third_measurement))

    first_measurement = second_measurement
    second_measurement = third_measurement
  end

  return sums_array
end

day1_data = read_data()
sums = sum_measurement_tuples(day1_data)
println(get_number_of_depth_increments(sums))