using Test
include("day3.jl")

@testset "day3" begin
  input = ["101", "000", "010"]
  # @testset "create_adjunct_diagnostic_data" begin
  #   @test create_adjunct_diagnostic_data(input) == [[1, 0, 0], [0, 0, 1], [1, 0, 0]]
  # end

  @testset "get_most_common_bit" begin
    @test get_most_common_bit([1, 0, 0]) == "0"
  end

  @testset "get_least_common_bit" begin
    @test get_least_common_bit([1, 0, 0]) == "1"
  end

  @testset "calculate_gamma_rate" begin
    @test calculate_gamma_rate(input) == 0
  end

  @testset "calculate_epsilon_rate" begin
    @test calculate_epsilon_rate(input) == 7
  end
end