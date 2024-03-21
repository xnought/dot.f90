# dot.f90

Hello Wolrd dot product script for fortran90. Sped up with `make build-fast` to product the `fdot` executable which uses openmp for parallel processing.

```fortran
integer function dot(A, B)
  implicit none
  integer, intent(in) :: A(:)
  integer, intent(in) :: B(:)
  integer :: i

  dot = 0
  !$OMP PARALLEL DO REDUCTION(+:dot)
  do i = 1, size(A)
    dot = dot + (A(i) * B(i))
  end do
end function dot
```
