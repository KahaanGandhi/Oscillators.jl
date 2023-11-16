Oscillations.jl provides computational tools to study and solve the equations of motion for a variety of spring, mass, and pendulum systems.

## Contents
The repository is a mix of Julia scripts (`.jl`) and Jupyter notebooks (`.ipynb`). File names indicate the number of masses and the setup of the system. 
- **Julia Scripts**: Computation-oriented, harnessing Julia's high performance scientific computing capabilities
- **Jupyter Notebooks**: Physics-focused, covering the relavent linear algebra and numerical methods
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




