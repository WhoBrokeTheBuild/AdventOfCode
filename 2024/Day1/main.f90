
subroutine part1(answer, count, left_numbers, right_numbers)

    integer, intent(out) :: answer
    integer, intent(inout) :: count, left_numbers(count), right_numbers(count)
    integer :: i, diff, left_index, right_index

    answer = 0
    do i=1, count
        left_index = 0
        right_index = 0
        do j=1, count
            if (left_index == 0 .or. left_numbers(j) < left_numbers(left_index)) then
                left_index = j
            end if

            if (right_index == 0 .or. right_numbers(j) < right_numbers(right_index)) then
                right_index = j
            end if
        end do

        if (left_numbers(left_index) < right_numbers(right_index)) then
            diff = right_numbers(right_index) - left_numbers(left_index)
        else
            diff = left_numbers(left_index) - right_numbers(right_index)
        end if

        answer = answer + diff

        left_numbers(left_index) = huge(i)
        right_numbers(right_index) = huge(i)
    end do

end subroutine

subroutine part2(answer, count, left_numbers, right_numbers)

    integer, intent(out) :: answer
    integer, intent(inout) :: count, left_numbers(count), right_numbers(count)
    integer :: i, j, right_count

    answer = 0
    do i=1, count
        right_count = 0
        do j=1, count
            if (left_numbers(i) == right_numbers(j)) then
                right_count = right_count + 1
            end if
        end do

        answer = answer + (left_numbers(i) * right_count)

    end do

end subroutine

program day1
    implicit none

    integer :: iounit, ios
    integer :: i, count, answer
    integer, allocatable :: left_numbers(:), right_numbers(:)

    open(newunit=iounit, file='input.txt', iostat=ios)
    
    count = 0
    do
        read(iounit, *, iostat=ios)
        if (ios /= 0) exit
        count = count + 1
    end do
    
    rewind(iounit)

    allocate(left_numbers(count))
    allocate(right_numbers(count))

    do i=1, count
        read(iounit, *) left_numbers(i), right_numbers(i)
    end do
    close(iounit)

    ! call part1(answer, count, left_numbers, right_numbers)
    call part2(answer, count, left_numbers, right_numbers)
    print *, answer

    deallocate(left_numbers)
    deallocate(right_numbers)

end program