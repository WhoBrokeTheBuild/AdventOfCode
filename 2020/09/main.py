#!/usr/bin/env python3

import itertools

def part1(nums):
    processed = nums[:25]

    for num in nums[25:]:
        permutations = itertools.permutations(processed[-25:], 2)
        options = [ item[0] + item[1] for item in permutations ]
        if num not in options:
            return num
        processed.append(num)

def part2(nums):
    invalidNum = part1(nums)

    for i in range(len(nums)):
        testNums = [ nums[i] ]
        for num in nums[i + 1:]:
            testNums.append(num)
            
            testValue = sum(testNums)
            if testValue == invalidNum:
                return min(testNums) + max(testNums)
            elif testValue > invalidNum:
                break


with open('input.txt') as file:
    lines = file.readlines()
    nums = [int(n) for n in lines]

    print(part1(nums))
    print(part2(nums))
