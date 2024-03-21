
module dot_module
  implicit none
  contains 
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
end module dot_module

program main
  use dot_module
  implicit none

#define N 1000000
  integer :: A(N)  
  integer :: B(N)  
  integer :: i
  integer :: product

  do i = 1, N
    if (modulo(i, 2) == 0) then
      A(i) = 1
      B(i) = 0
      cycle
    end if
    B(i) = 1
    A(i) = 0
  end do

  do i = 1, 10000
    product = dot(A, B)
  end do
  
end program main