# Example of calling c functions from fortran subroutines

This is an example for uses the ISO_C_Binding module, which requires fortran 2003 or later.

## Compiling the examples

The provided makefile uses `gcc`, and `f95` to build the included files into an executable `main`.
Modify the `CC`, `FC`

Running `./main` prints example output to the console, showing that the c code behaves as intended.

## Files

+ `myFunctions.h`
  + Header file declaring function prototypes for the C/c++ code
+ `myFunctions.cpp`
  + c++ file containing the implementation of c/c++ functions to be called from fortarn
+ `myModule.f90`
  + free format fortran (2003+) module providing fortran subroutines which call c functions via the iso_c_binding module
+ `main.f90`
  + free format fortran file as a sample application.
+ `Makefile`
  + Makefile to compile the `.f90` and `.cpp` files, and link them 
