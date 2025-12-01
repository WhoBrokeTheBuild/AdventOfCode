
subroutine part1(answer)

    integer, intent(out) :: answer

    answer = 0

end subroutine

subroutine part2(answer)

    integer, intent(out) :: answer

    answer = 0

end subroutine

program day1
    implicit none

    integer :: iounit, ios
    integer :: i, answer
    integer :: numbers(8)

    open(newunit=iounit, file='test.txt', iostat=ios)
    
    answer = 0
    do
        numbers(:) = huge(numbers)
        read(iounit, fmt='(8I)', advance='no', iostat=ios) numbers
        if (ios /= 0) exit

        do i=1, 8
            print *, numbers(i)
        end do
        print *
    end do
    
    print *, answer

end program