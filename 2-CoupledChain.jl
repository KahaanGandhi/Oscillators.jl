#=
Consider three masses coupled by four springs. Using Newton's second law, we have:
  F₁ = -2kx₁ + kx₂      ⟶ mẍ₁ + 2kx₁ - kx₂ = 0
  F₂ = kx₁ - 2kx₂ + kx₃ ⟶ mẍ₂ + 2kx₂ - kx₁ - kx₃ = 0
  F₃ = kx₂ - 2kx₃       ⟶ mẍ₃ + 2kx₃ - kx₂ = 0
We propose the ansatz x(t) = [x₁⁰, x₂⁰, x₃⁰]ᵀ eᶦωt for the solution, and the EoMs become
              [-2  1  0]
  -ω² x = ω₀² [ 1 -2  1] x
              [ 0  1 -2] 
where ω₀ = √(k/m) is the characteristic frequency of the system. The eigenvalues of this matrix correspond to the squares 
of the normal mode frequencies, ω₁, ω₂, ω₃, and their corresponding eigenvectors e₁, e₂, e₃ represent the mode shapes:
  ω₁ = ω₀ √(2 - √2)  ⟶ e₁ = [ 1,  √2,  1]ᵀ
  ω₃ = ω₀ √(2 + √2)  ⟶ e₂ = [ 1, -√2,  1]ᵀ
  ω₂ = ω₀ √2         ⟶ e₃ = [-1,   0,  1]ᵀ
These normal modes define the characteristic vibrations of the mass-spring system.
=#

using LinearAlgebra

x₀ = [5; 0; 2]
v₀ = [2; 7; 0]
m = 2.5
k = 10
t = 4

function solve_three_EoMs(x₀,v₀,m,k,t)

    ω₀ = √(k/m)
    A = [ 1 -1  1; √2  0 -√2; 1  1  1]
    e₁ = A[:, 1]; e₂ = A[:, 2]; e₃ = A[:, 3] 

    e₁ /= norm(e₁); ω₁ = ω₀ * √(2 - √2)
    e₂ /= norm(e₂); ω₂ = ω₀ * √2
    e₃ /= norm(e₃); ω₃ = ω₀ * √(2 + √2)

    ReC₁ = dot(e₁,x₀); ImC₁ = (-1/ω₁) * dot(e₁,v₀)
    ReC₂ = dot(e₂,x₀); ImC₂ = (-1/ω₂) * dot(e₂,v₀)
    ReC₃ = dot(e₃,x₀); ImC₃ = (-1/ω₃) * dot(e₃,v₀)

    A₁ = √(ReC₁^2 + ImC₁^2); ϕ₁ = atan(ImC₁, ReC₁)
    A₂ = √(ReC₂^2 + ImC₂^2); ϕ₂ = atan(ImC₂, ReC₂)
    A₃ = √(ReC₃^2 + ImC₃^2); ϕ₃ = atan(ImC₃, ReC₃)

    x(t) = A₁*cos(ω₁*t + ϕ₁)*e₁ + A₂*cos(ω₂*t + ϕ₂)*e₂ + A₃*cos(ω₃*t + ϕ₃)*e₃
    InitialPositionVector = x(0)

    A₁_RND = round(A₁, digits=2); ω₁_RND = round(ω₁, digits=2); ϕ₁_RND = round(ϕ₁, digits=2)
    A₂_RND = round(A₂, digits=2); ω₂_RND = round(ω₂, digits=2); ϕ₂_RND = round(ϕ₂, digits=2)
    A₃_RND = round(A₃, digits=2); ω₃_RND = round(ω₃, digits=2); ϕ₃_RND = round(ϕ₃, digits=2)

    println("x₁(t) = $(A₁_RND)cos($(ω₁_RND)t + $(ϕ₁_RND)) + $(A₂_RND)cos($(ω₂_RND)t + $(ϕ₂_RND)) + $(A₃_RND)cos($(ω₃_RND)t + $(ϕ₃_RND))")
    println("x₂(t) = $(A₁_RND)cos($(ω₁_RND)t + $(ϕ₁_RND)) + $(A₂_RND)cos($(ω₂_RND)t + $(ϕ₂_RND)) - $(A₃_RND)cos($(ω₃_RND)t + $(ϕ₃_RND))")
    println("x₃(t) = $(A₁_RND)cos($(ω₁_RND)t + $(ϕ₁_RND)) - $(A₂_RND)cos($(ω₂_RND)t + $(ϕ₂_RND)) + $(A₃_RND)cos($(ω₃_RND)t + $(ϕ₃_RND))")

    println("At t = 0s, calculated x(t) is [$(round.(InitialPositionVector, digits=2))], which ", x(0) ≈ x₀ ? "agrees" : "does NOT agree", " with given x₀ of ", x₀)
    println("At t = ", t, "s, x(t) = ", round.(x(t), digits=2))
    
end

solve_three_EoMs(x₀,v₀,m,k,t)