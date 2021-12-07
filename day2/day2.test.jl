using Test
include("day2.jl")

@testset "day2" begin
  @testset "get_final_position" begin
    @test get_final_position(["forward 5", "down 4", "up 1"]) == Dict("z" => 5, "y" => 3)
    @test_throws DomainError get_final_position(["sideways 4"])
  end
end