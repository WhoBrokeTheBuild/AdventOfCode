#!/usr/bin/env python3

def countTrees(lines, dx, dy):
    width = len(lines[0])
    height = len(lines)
    treeCount = 0

    x = 0
    y = 0

    while y < height:
        if lines[y][x] == '#':
            treeCount += 1
            
        x += dx
        y += dy
        x %= width

    return treeCount

def part1(lines):
    return countTrees(lines, 3, 1)

def part2(lines):
    result = 1
    result *= countTrees(lines, 1, 1)
    result *= countTrees(lines, 3, 1)
    result *= countTrees(lines, 5, 1)
    result *= countTrees(lines, 7, 1)
    result *= countTrees(lines, 1, 2)
    return result

with open('input.txt') as file:
    lines = file.readlines()

    # Remove trailing newlines and empty lines
    for i in range(len(lines)):
        lines[i] = lines[i].rstrip()
        if len(lines[i]) == 0:
            del lines[i]
            
    print(part1(lines))
    print(part2(lines))
