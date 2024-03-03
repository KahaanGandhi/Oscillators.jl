## Contents
- `mass-systems`: Covers a range of spring, mass, string, and pendula systems, emphasizing the generalization from discrete to continuous systems
- `travelling-waves`: Explores the wave equation and Maxwell's equations, reviewing relevant vector, differential, and integral calculus 
- `fourier-series`: Introduces Fourier series and analysis, with classic examples 
- `julia-scripts`: Computation-oriented, harnesses Julia's high-performance scientific computing capabilities

## Installation Instructions
You will need to have Julia installed, as well as a Jupyter environment capable of running Julia notebooks.

### Installing Julia

1. Download Julia from the [official Julia website](https://julialang.org/downloads/).
2. Install Julia by following the instructions for your operating system.

### Setting Up Jupyter with Julia

If Jupyter is not installed, use one of the following methods:

- **Via Anaconda**:
  - Visit the [Anaconda download page](https://www.anaconda.com/products/individual) and download the installer for your operating system.
  - Follow the installation instructions on the website.
  - Once Anaconda is installed, open your terminal and run:
```bash
$ conda install -c conda-forge notebook
```

- **Via pip** (if Python is already installed):
  - Open your terminal and run:
```bash
$ pip install notebook
```

After Jupyter is installed, add the Julia kernel:
```bash
$ julia
julia> using Pkg
julia> Pkg.add("IJulia")
```

## Cloning the Repository

To clone the repository to your local machine:

```bash
$ git clone https://github.com/KahaanGandhi/Oscillations.jl.git
$ cd Oscillations.jl
```

## Installing Dependencies

To install the Julia's `LinearAlgebra` package:

```bash
$ julia
julia> using Pkg
julia> Pkg.add("LinearAlgebra")
```




