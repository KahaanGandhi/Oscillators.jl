#=
A tridiagonal matrix representation for N identical masses coupled by N+1 identical springs. The NxN matrix A has the form:

     [ -2     1     0   ...    0     ]
     [  1    -2     1   ...    0     ]
 A = [  0     1    -2   ...    0     ]
     [ ...   ...   ...  ...   ...    ]
     [  0     0   ...    1    -2     ]

 where the diagonal elements are -2, representing the coupling between a mass and its two neighboring springs, and the 
 off-diagonal elements are 1, representing the coupling between adjacent masses.
=#

using LinearAlgebra

x₀ = [5; 0; 0; 5]  
v₀ = [0; 4; 4; 0]  
m = 2.5         
k = 10          
t = 0.2     

function tridiagonal_matrix(N)
    A = zeros(N,N)
    for i in 1:N, j in 1:N
        i == j ? A[i,j] = -2 : 0
        abs(i - j) == 1 ? A[i,j] = 1 : 0 
    end
    return A
end

function position_vector(t, eigenvalues, eigenvectors, x₀, v₀, m)
    N = length(x₀)
    length(x₀) !== length(v₀) ? println("Error: length of x₀ and v₀ must be $N.") : 
    x_t = zeros(Complex{Float64}, N)
    for i in 1:N
        ω = √(abs(eigenvalues[i])) * √(k/m)
        e = eigenvectors[:, i]
        ReC = dot(e, x₀)
        ImC = (-1/ω) * dot(e, v₀)
        A = √(ReC^2 + ImC^2)
        ϕ = atan(ImC, ReC)
        x_t += A * cos(ω * t + ϕ) * e
    end
    return real(x_t)
end

function solve_N_EoMs(x₀, v₀, m, k, t)
    N = length(x₀)
    A = tridiagonal_matrix(N)
    eigenvalues, eigenvectors = eigen(A)
    x_t = position_vector(t, eigenvalues, eigenvectors, x₀, v₀, m)
    println("At t = ", t, "s, x(t) = ", round.(x_t, digits=2))
end

solve_N_EoMs(x₀, v₀, m, k, t)