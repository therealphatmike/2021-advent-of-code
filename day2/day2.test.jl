using Test
include("day2.jl")

@testset "day2" begin
  @testset "get_final_position" begin
    instructions = ["forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2"]
    @test get_final_position(instructions) == Dict("z" => 15, "y" => 60, "aim" => 10)
    @test_throws DomainError get_final_position(["sideways 4"])
  end
end