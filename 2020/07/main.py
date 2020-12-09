#!/usr/bin/env python3

import re
import copy

def getContainingBags(bagMap, searchBag):
    containers = set()

    for container,bags in bagMap.items():
        if searchBag in bags:
            containers.add(container)
            containers = containers.union(getContainingBags(bagMap, container))

    return containers

def part1(lines):
    expr = re.compile('([a-z]+ [a-z]+) bags?')
    bagMap = dict()
    for line in lines:
        groups = expr.findall(line)
        container = groups[0]
        bags = set(groups[1:])

        if 'no other' in bags:
            continue

        if container not in bagMap:
            bagMap[container] = set()

        bagMap[container] = bagMap[container].union(bags)

    return len(getContainingBags(bagMap, 'shiny gold'))

def countBags(bagMap, searchBag):
    count = 0

    if searchBag not in bagMap:
        return count

    for bags in bagMap[searchBag]:
        count += int(bags[0])
        count += int(bags[0]) * countBags(bagMap, bags[1])

    return count

def part2(lines):
    expr = re.compile('([0-9]+)? ?([a-z]+ [a-z]+) bags?')
    bagMap = dict()
    for line in lines:
        groups = expr.findall(line)
        container = groups[0][1]
        bags = groups[1:]

        if bags[0][1] == 'no other':
            continue

        bagMap[container] = bags

    return countBags(bagMap, 'shiny gold')

with open('input.txt') as file:
    lines = file.readlines()
            
    print(part1(lines))
    print(part2(lines))
