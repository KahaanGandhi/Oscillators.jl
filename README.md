# Oscillators.jl
Welcome to `Oscillations.jl`, a repository of Julia scripts and Jupyter notebooks maintained by [@KahaanGandhi](https://github.com/KahaanGandhi). This repository provides computational tools and educational resources to study and solve the equations of motion for a variety of spring, mass, and pendulum systems. 

## Contents
The repository is a mix of Julia scripts (`.jl`) and Jupyter notebooks (`.ipynb`).
- **Julia Scripts**: These are computation-oriented, harnessing Julia's optimized performance for scientific computing
- **Jupyter Notebooks**: The notebooks cover the physics of each dynamic system, with explanations of the linear algebra and numerical methods involved.

## Installation Instructions
To use Oscillations.jl, you will need to have Julia installed, as well as a Jupyter environment capable of running Julia notebooks.

### Installing Julia

1. Download Julia from the [official Julia website](https://julialang.org/downloads/).
2. Install Julia by following the instructions for your operating system.

### Setting Up Jupyter with Julia

1. If you don't have Jupyter installed, you can choose one of the following methods:
   - Via Anaconda: Download and install Anaconda from [here](https://www.anaconda.com/products/individual).
   - Via pip (if you have Python installed):
     ```bash
     pip install notebook
     ```
2. Once Jupyter is installed, you'll need to add the Julia kernel. Start Julia and run:
   ```julia
   using Pkg
   Pkg.add("IJulia")

### Cloning the Repository

To begin, clone the repository to your local machine:

```bash
git clone https://github.com/KahaanGandhi/Oscillations.jl.git
cd Oscillations.jl 
```

### Dependencies

The code in this repository relies on Julia's built-in `LinearAlgebra` module for many computations. To ensure you have access to these features, start Julia and enter the following:

```julia
using Pkg
Pkg.add("LinearAlgebra")
```


