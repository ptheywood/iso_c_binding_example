module myModule
    ! use the ISO_C_binding module
    use, intrinsic :: ISO_C_Binding
    ! do not allow implicit types, they make things less clear
    implicit none

    ! Define the subroutines which this module contains.
    contains 


    ! Subroutine to call the c version of helloWorld.
    subroutine helloWorldFromC()
        interface 
            subroutine helloWorld_c () bind (c, name="helloWorld")
                use, intrinsic :: iso_c_binding
            end subroutine helloWorld_c
        end interface

        call helloWorld_c()
    end subroutine helloWorldFromC
    
    subroutine mySubroutine(f_a, f_b, f_c)
        ! Define the types and intent(in, out, or inout) of variables in the fortran subroutine. 
        ! Variables are only prefixed with f_ for clarity
        integer *4, intent(in)                 :: f_a ! A single 4 byte integer
        real    *8, intent(in), dimension(f_a) :: f_b ! An array of f_a 8 byte floating point numbers
        logical   , intent(inout)              :: f_c ! a logical/boolean, to be returned.

        ! Fortran an C use different size logicals, so an extra varaible must be used.
        logical *1 f_c_byte

        ! Define the interface for the c function.
        interface
            ! Create a new fortran-callable interface called my_function_c, which maps to the function my_function provided in the c/c++ file
            ! Variables are only prefixed with c_ for clarity.
            subroutine myFunction_c (c_a, c_b, c_c) bind(c, name="myFunction")
                ! Use the iso_c_binding module (again)
                use, intrinsic :: iso_c_binding
                ! Define the c_types of each parameter.
                ! Single values with intent(in) can be specified as value. 
                ! Arrays, intent(out) and intent(inout) should not as they are pass by reference.
                integer(c_int), value          :: c_a ! A single 4 byte integer
                real(c_double), dimension(c_a) :: c_b ! An array of c_a, 8 byte floats
                logical(c_bool)                :: c_c ! a single c_boolean
            end subroutine myFunction_c
        end interface

        ! For logicals, assign the value of the 1 byte logical from teh 4 byte fortran logical
        f_c_byte = f_c

        ! Call the wrapped c function
        call myFunction_c(f_a, f_b(1:f_a), f_c_byte)

        ! re assign the logical, this is only required for inout logicals
        f_c = f_c_byte

    end subroutine mySubroutine

end module myModule
