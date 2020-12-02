#!/usr/bin/env python3

import re

def part1(lines):
    validCount = 0
    for line in lines:
        groups = re.search('^([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)$', line).groups()
        minCount = int(groups[0])
        maxCount = int(groups[1])
        letter = groups[2]
        password = groups[3]

        count = password.count(letter)
        if count >= minCount and count <= maxCount:
            validCount += 1

    return validCount

def part2(lines):
    validCount = 0
    for line in lines:
        groups = re.search('^([0-9]+)-([0-9]+) ([a-z]): ([a-z]+)$', line).groups()
        first = int(groups[0]) - 1
        second = int(groups[1]) - 1
        letter = groups[2]
        password = groups[3]

        count = 0
        if password[first] == letter:
            count += 1
            
        if password[second] == letter:
            count += 1
        
        if count == 1:
            validCount += 1

    return validCount

with open('input.txt') as file:
    lines = file.readlines()
    print(part1(lines))
    print(part2(lines))
