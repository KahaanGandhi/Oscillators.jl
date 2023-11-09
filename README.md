# Oscillators.jl
Oscillations.jl provides computational tools to study and solve the equations of motion for a variety of spring, mass, and pendulum systems.

## Contents
The repository is a mix of Julia scripts (`.jl`) and Jupyter notebooks (`.ipynb`).
- **Julia Scripts**: Computation-oriented, harnessing Julia's high performance scientific computing capabilities
- **Jupyter Notebooks**: Physics-focused, covering the linear algebra and numerical methods involved in each system

## Installation Instructions
To use Oscillations.jl, you will need to have Julia installed, as well as a Jupyter environment capable of running Julia notebooks.

### Installing Julia

1. Download Julia from the [official Julia website](https://julialang.org/downloads/).
2. Install Julia by following the instructions for your operating system.

### Setting Up Jupyter with Julia

If Jupyter is not installed, use one of the following methods:

- **Via Anaconda**:
  ```bash
  wget https://www.anaconda.com/products/individual # Download Anaconda installer
  sh ~/Downloads/Anaconda3-2022.05-Linux-x86_64.sh  # Run Anaconda installer
  conda install -c conda-forge notebook              # Install Jupyter Notebook
  ```

- **Via pip** (if Python is already installed):
  ```bash
  pip install notebook 
  ```

After Jupyter is installed, add the Julia kernel by starting Julia in the terminal:

```bash
julia 
```

Inside the Julia REPL, run:

```julia
using Pkg
Pkg.add("IJulia")
```

## Cloning the Oscillations.jl Repository

To clone the repository to your local machine, run:

```bash
git clone https://github.com/KahaanGandhi/Oscillations.jl.git
cd Oscillations.jl
```

## Installing Dependencies

To install the required Julia dependencies, start Julia and run:

```bash
julia 
```

Inside the Julia REPL, execute:

```julia
using Pkg
Pkg.add("LinearAlgebra")
```


