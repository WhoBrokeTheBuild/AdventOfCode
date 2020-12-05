#!/usr/bin/env python3

import math

def getSeatIDs(lines):
    seatIDs = set()
    for line in lines:
        rowMin = 0
        rowMax = 127
        for c in line[:7]:
            delta = math.ceil((rowMax - rowMin) / 2)
            if c == 'F':
                rowMax -= delta
            elif c == 'B':
                rowMin += delta

        if rowMin != rowMax:
            print('%d != %d' % (rowMin, rowMax))

        row = rowMin

        colMin = 0
        colMax = 7
        for c in line[7:]:
            delta = math.ceil((colMax - colMin) / 2)
            if c == 'L':
                colMax -= delta
            elif c == 'R':
                colMin += delta
        
        if colMin != colMax:
            print('%d != %d' % (colMin, colMax))

        col = colMin

        seatIDs.add((row * 8) + col)

    return seatIDs

def part1(lines):
    maxSeatID = 0

    seatIDs = getSeatIDs(lines)
    for seatID in seatIDs:
        if seatID > maxSeatID:
            maxSeatID = seatID

    return maxSeatID

def part2(lines):
    minSeatID = 9999
    maxSeatID = 0

    seatIDs = getSeatIDs(lines)
    for seatID in seatIDs:
        if seatID > maxSeatID:
            maxSeatID = seatID
        if seatID < minSeatID:
            minSeatID = seatID

    for i in range(minSeatID, maxSeatID):
        if i in seatIDs:
            continue

        if (i - 1) in seatIDs and (i + 1) in seatIDs:
            return i

with open('input.txt') as file:
    lines = file.readlines()
            
    print(part1(lines))
    print(part2(lines))
