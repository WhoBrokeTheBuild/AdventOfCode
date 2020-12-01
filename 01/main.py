#!/usr/bin/env python3

def part1(nums):
    for i in range(len(nums)):
        for j in range(len(nums)):
            if i == j:
                continue
            if nums[i] + nums[j] == 2020:
                return nums[i] * nums[j]

def part2(nums):
    for i in range(len(nums)):
        for j in range(len(nums)):
            for k in range(len(nums)):
                if i == j or j == k or i == k:
                    continue
                if nums[i] + nums[j] + nums[k] == 2020:
                    return nums[i] * nums[j] * nums[k]

with open('input.txt') as file:
    lines = file.readlines()
    nums = [int(n) for n in lines]

    print(part1(nums))
    print(part2(nums))
