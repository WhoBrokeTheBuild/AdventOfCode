#!/usr/bin/env python3

def part1(data):
    yesCount = 0

    currentSet = set()
    people = data.split('\n')
    for person in people:
        if person == '':
            yesCount += len(currentSet)
            currentSet = set()
            continue

        currentSet |= set(person)

    return yesCount

def part2(data):
    yesCount = 0

    currentSet = None
    people = data.split('\n')
    for person in people:
        if person == '':
            yesCount += len(currentSet)
            currentSet = None
            continue

        if currentSet == None:
            currentSet = set(person)
        else:
            currentSet &= set(person)

    return yesCount

with open('input.txt') as file:
    data = file.read()
            
    print(part1(data))
    print(part2(data))