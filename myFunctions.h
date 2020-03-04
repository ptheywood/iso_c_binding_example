#pragma once

#include <stdio.h>

// c header file containing a method to be called from fortran.


/** 
 * Simple helloWorld function from c
 */
extern "C" void helloWorld();



/**
 * Prototype for the function.
 * @param a - single 4 byte integer passed into the function
 * @param b - array of double precision floating point numbers. Assume the length is provided by a.
 * @param c - pointer to a single boolean. Pointer as intent is (inout)
 * intent(in) values can be cosnt'd to generate compile time errors if they are attempted to be changed.
 * intent(out) or intent(inout) should not be const.
 * Must be extern "c" for linking
 */
extern "C" void myFunction(int const a, double const * const b, bool * c);
