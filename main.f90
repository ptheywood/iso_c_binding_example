! Fortan program (i.e. the main method)
program myFortranProgram
    ! use my module
    use myModule
    implicit none
    
    ! Call the hello world fortran subroutine
    call helloWorldFromF

    ! Call the hello world c subroutine
    call helloWorldFromC

    ! Call the wrapper function for mySubroutine
    call wrapper_mySubroutine


end program


subroutine helloWorldFromF
    print *, "Hello World from Fortran"
end subroutine helloWorldFromF
    

! A simple warpper for calling mysubroutine outside of main.
subroutine wrapper_mySubroutine
    use myModule
    implicit none

    ! Declare variables

    integer :: a
    real *8, dimension(4) :: b
    logical :: c

    integer :: i

    ! Initialise the array data
    print *, "Initialising fortran data"
    a = 4
    print *, "a:", a
    print *, "b:"
    do i = 1, a
        b(i) = i
        print *, "b(", i, ")", b(i)
    end do
    c = .false.
    print *, "c:", c

    print *, "calling C function"
    ! Call the subroutine

    call mySubroutine(a, b, c)
    
    ! Print the return value.
    print *, "Printing returned value. Expect .true."
    print *, "c:", c
    


end subroutine wrapper_mySubroutine
