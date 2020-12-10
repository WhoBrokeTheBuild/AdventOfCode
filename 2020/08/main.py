#!/usr/bin/env python3

import copy

def part1(lines):
    visited = list()

    acc = 0
    pc = 0
    while pc not in visited:
        visited.append(pc)
        parts = lines[pc].split(' ')

        inst = parts[0]
        value = int(parts[1])

        if inst == 'nop':
            pc += 1
        elif inst == 'acc':
            acc += value
            pc += 1
        elif inst == 'jmp':
            pc += value

    return acc

def runUntilFault(lines, visited = list(), acc = 0, pc = 0, mutable = True):
    end = len(lines)

    while pc not in visited:
        if pc == end:
            return acc

        visited.append(pc)
        parts = lines[pc].split(' ')

        inst = parts[0]
        value = int(parts[1])
        
        if mutable and (inst == 'nop' or inst == 'jmp'):
            # treat as nop
            nopVisited = copy.copy(visited)
            nopResult = runUntilFault(lines, nopVisited, acc, pc + 1, False)
            if nopResult != None:
                return nopResult

            # treat as jmp
            jmpVisited = copy.copy(visited)
            jmpResult = runUntilFault(lines, jmpVisited, acc, pc + value, False)
            if jmpResult != None:
                return jmpResult
        
        if inst == 'acc':
            acc += value
            pc += 1
        elif inst == 'nop':
            pc += 1
        elif inst == 'jmp':
            pc += value
        
    return None

def part2(lines):
    return runUntilFault(lines)

with open('input.txt') as file:
    lines = file.readlines()
            
    # Remove trailing newlines and empty lines
    for i in range(len(lines)):
        lines[i] = lines[i].rstrip()
        if len(lines[i]) == 0:
            del lines[i]

    print(part1(lines))
    print(part2(lines))
