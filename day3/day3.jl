include("../common.jl")

function create_adjunct_diagnostic_data(diagnostics)
  adjunct_array = fill(0, (12, 1000))

  for bit::Int in 1:length(diagnostics[1])
    for code::Int in 1:length(diagnostics)
      adjunct_array[bit, code] = parse(Int, diagnostics[code][bit])
    end
  end

  return(adjunct_array)
end

function get_most_common_bit(column)
  zeros = 0
  ones = 0

  for bit in column
    if bit == 1
      ones += 1
    else
      zeros += 1
    end
  end

  if zeros > ones
    return "0"
  else
    return "1"
  end
end

function get_least_common_bit(column) 
  zeros = 0
  ones = 0

  for bit in column
    if bit == 1
      ones += 1
    else
      zeros += 1
    end
  end

  if zeros < ones
    return "0"
  else
    return "1"
  end
end

function calculate_gamma_rate(data)
  gamma_rate = ""

  for column in eachrow(data)
    gamma_rate = string(gamma_rate, get_most_common_bit(column))
  end

  return parse(Int, gamma_rate, base = 2)
end

function calculate_epsilon_rate(data)
  epsilon_rate = ""

  for column in eachrow(data)
    epsilon_rate = string(epsilon_rate, get_least_common_bit(column))
  end

  return parse(Int, epsilon_rate, base = 2)
end

function process_diagnostics(data)
  adjunct_diagnostic_codes = create_adjunct_diagnostic_data(data)
  gamma_rate = calculate_gamma_rate(adjunct_diagnostic_codes)
  epsilon_rate = calculate_epsilon_rate(adjunct_diagnostic_codes)
  gamma_x_epsilon = gamma_rate * epsilon_rate

  println("Gamma rate: $gamma_rate")
  println("Epsilon rate: $epsilon_rate")
  println("Gamma x Epsilon: $gamma_x_epsilon")
end

data = read_data("./day3/day3_data.txt")
process_diagnostics(data)