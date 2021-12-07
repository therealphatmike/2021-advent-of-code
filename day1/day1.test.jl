using Test
include("day1.jl")

@testset "day 1.1" begin
  @testset "did_depth_increment" begin
    @test did_depth_increment(2, 3) == true
    @test did_depth_increment(3, 2) == false
  end

  @testset "get_number_of_depth_increments" begin
    @test get_number_of_depth_increments([1, 2, 3, 4, 5]) == 4
    @test get_number_of_depth_increments([5, 4, 3, 2, 1]) == 0
    @test get_number_of_depth_increments([1, 2, 3, 5, 4]) == 3
  end

  @testset "sum_measurement_tuples" begin
    @test sum_measurement_tuples([1, 2, 3, 4, 5, 6, 7]) == [6, 9, 12, 15, 18]
  end
end