include("../common.jl")

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

function sum_measurement_tuples(input)
  sums_array = []
  first_measurement = parse(Int, popfirst!(input))
  second_measurement = parse(Int, popfirst!(input))

  for element in input
    third_measurement = parse(Int, element)

    push!(sums_array, (first_measurement + second_measurement + third_measurement))

    first_measurement = second_measurement
    second_measurement = third_measurement
  end

  return sums_array
end

day1_data = read_data("./day1/day1_data.txt")
sums = sum_measurement_tuples(day1_data)
println(get_number_of_depth_increments(sums))