#include "myFunctions.h"

extern "C" void helloWorld(){
    fprintf(stdout, "helloWorld from C\n");
}

// Implementation of my_function.
extern "C" void myFunction(int const a, double const * const b, bool * c){
    fprintf(stdout, "c_a: %d, c_b %p, c_c %d\n", a, b, *c);
    // prints each value in b. Note that arrays are 0 indexed in C, but (probably) 1 indexed in fortran! This *will probably* cause issues. 2D arrays are also represented differently in memory (avoid them)
    for(int index = 0; index < a; index ++){
        fprintf(stdout, "c_b[%d] = %.3f\n", index, b[index]);
    }
    // Set the inout logical to true to demonstrate in-out. Must de-reference as it's a pointer.
    *c = true;
}
