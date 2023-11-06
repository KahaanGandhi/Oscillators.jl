using LinearAlgebra

# Rounds any integer near 0 to 0, resolving floating point errors (threshold of 1e-12)
function NearZero(x)
    return abs(x) < 1e-12 ? 0.0 : x
end

# Phase shift calculation, adding π when needed
function PhaseShift(Re, Im)
    return Re < 1 ? atan(Im/Re) + π : atan(Im/Re)
end

# Constants
g = 9.81;
eₚ = [1/√2; 1/√2];
eᵦ = [1/√2; -1/√2];

# Initial conditions
x₀ = [5; 0]
v₀ = [2; 7]
m = 2.5
l = 0.45
k = 10

# A later time (s)
t = 5.3

# Calculates relavent variable values and |x(t)> at various times
function SymmetricCoupledPendula(x₀,v₀,m,l,k)

    # Angular frequencies for each mode
    ωₚ = √(g/l)
    ωᵦ = √(g/l + 2k/m)

    # Real and complex compononents of complex coefficients
    ReCp = eₚ ⋅ x₀
    ReCb = eᵦ ⋅ x₀
    ImCp = (-1/ωₚ) * (eₚ ⋅ v₀)
    ImCb = (-1/ωᵦ) * (eᵦ ⋅ v₀)

    # Resolving numerical errors
    for value in [ReCp,ReCb,ImCp,ImCb, ωₚ,ωᵦ]
        value = NearZero(value)
    end

    # Calculating ampltidues and phase shifts, checking for ϕ = 0 case
    Aₚ = √(ReCp^2 + ImCp^2)
    Aᵦ = √(ReCb^2 + ImCb^2)
    ϕₚ = NearZero(PhaseShift(ReCp, ImCp))
    ϕᵦ = NearZero(PhaseShift(ReCb, ImCb))

    # Listing calculated values
    println("Values calculated using the inputted initial conditions:")
    varNames = ["ωₚ","ωᵦ","ReCp","ReCb","ImCp","ImCb","Aₚ","Aᵦ","ϕₚ","ϕᵦ"]
    varValues = [ωₚ, ωᵦ,ReCp,ReCb,ImCp,ImCb,Aₚ,Aᵦ,ϕₚ,ϕᵦ]
    for i in 1:10
        println(varNames[i], ": ", round(varValues[i],digits=2))
    end

    # Simplifying equation for position as a function of time.
    println()
    println("Note that [x; y] denotes a column vector in R2.")
    println("Plugging these values into x(t) = Aₚ cos(ωₚt + ϕₚ)eₚ + Aᵦ cos(ωᵦt + ϕᵦ)eᵦ,")

    x_part1 = "$(round(Aₚ, digits=2)) (1 ÷ √2)cos($(round(ωₚ, digits=2))t + $(round(ϕₚ, digits=2)))"
    x_part2 = "$(round(Aᵦ, digits=2)) (1 ÷ √2)cos($(round(ωᵦ, digits=2))t + $(round(ϕᵦ, digits=2)))"
    println("x(t) = " * x_part1 * " × [1; 1] + " * x_part2 * " × [1; -1]")
    x_part1_calc = "$(round(Aₚ * 1/sqrt(2), digits=2))cos($(round(ωₚ, digits=2))t + $(round(ϕₚ, digits=2)))"
    x_part2_calc = "$(round(Aᵦ * 1/sqrt(2), digits=2))cos($(round(ωᵦ, digits=2))t + $(round(ϕᵦ, digits=2)))"
    println("x(t) = " * x_part1_calc * " × [1; 1] + " * x_part2_calc * " × [1; -1]")

    # Checking t = 0, and at variable time t
    x(t) = (Aₚ * cos(ωₚ*t + ϕₚ)*eₚ + Aᵦ * cos(ωᵦ*t + ϕᵦ)*eᵦ)
    InitialPositionVector = [round(x(0)[1], digits=3); round(x(0)[2], digits=3)]
    LaterPositionVector = [round(x(t)[1], digits=3); round(x(t)[2], digits=3)]
    println()


    # Printing solutions for x₁(t) and x₂(t)
    x₁_part1 = "$(round(Aₚ * 1/sqrt(2), digits=2))cos($(round(ωₚ, digits=2))t + $(round(ϕₚ, digits=2)))"
    x₁_part2 = "$(round(Aᵦ * 1/sqrt(2), digits=2))cos($(round(ωᵦ, digits=2))t + $(round(ϕᵦ, digits=2)))"
    println("x₁(t) = " * x₁_part1 * " + " * x₁_part2)
    x₂_part1 = "$(round(Aₚ * 1/sqrt(2), digits=2))cos($(round(ωₚ, digits=2))t + $(round(ϕₚ, digits=2)))"
    x₂_part2 = "$(round(Aᵦ * 1/sqrt(2), digits=2))cos($(round(ωᵦ, digits=2))t + $(round(ϕᵦ, digits=2)))"
    println("x₂(t) = " * x₂_part1 * " - " * x₂_part2)
    println()

    # Printing initial and later position vectors
    println("At t = 0s, calculated x(t) is $InitialPositionVector" * 
    (InitialPositionVector == x₀ ? ", which agrees with given x₀" : ", which does NOT agree with x₀") * 
    ", of $x₀")
    println("At t = ", t, "s, calculated x(t) is ", LaterPositionVector)
end

SymmetricCoupledPendula(x₀,v₀,m,l,k)