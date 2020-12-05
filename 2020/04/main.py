#!/usr/bin/env python3

def part1(data):
    requiredKeys = {
        'byr',
        'iyr',
        'eyr',
        'hgt',
        'hcl',
        'ecl',
        'pid'
    }

    validCount = 0

    passports = data.split('\n\n')
    for passport in passports:
        passport = passport.replace('\n', ' ')
        pairs = passport.split(' ')

        data = {}
        for pair in pairs:
            if len(pair) == 0:
                continue

            entry = pair.split(':')
            if entry[0] != 'cid':
                data[entry[0]] = entry[1]

        if set(data.keys()) != requiredKeys:
            continue

        validCount += 1

    return validCount
            

def part2(data):
    requiredKeys = {
        'byr',
        'iyr',
        'eyr',
        'hgt',
        'hcl',
        'ecl',
        'pid'
    }

    validEyeColors = [
        'amb',
        'blu',
        'brn',
        'gry',
        'grn',
        'hzl',
        'oth'
    ]

    validCount = 0

    passports = data.split('\n\n')
    for passport in passports:
        passport = passport.replace('\n', ' ')
        pairs = passport.split(' ')

        data = {}
        for pair in pairs:
            if len(pair) == 0:
                continue

            entry = pair.split(':')
            if entry[0] != 'cid':
                data[entry[0]] = entry[1]

        if set(data.keys()) != requiredKeys:
            continue

        if int(data['byr']) < 1920 or int(data['byr']) > 2002:
            continue

        if int(data['iyr']) < 2010 or int(data['iyr']) > 2020:
            continue

        if int(data['eyr']) < 2020 or int(data['eyr']) > 2030:
            continue

        units = data['hgt'][-2:]
        height = int(data['hgt'][:-2])
        if units == 'cm':
            if height < 150 or height > 193:
                continue
        elif units == 'in':
            if height < 59 or height > 76:
                continue
        else:
            continue

        if data['hcl'][0] != '#':
            continue

        try:
            hairColor = int(data['hcl'][1:], 16)
        except:
            continue

        if len(data['pid']) != 9 or not data['pid'].isnumeric():
            continue
        
        if data['ecl'] not in validEyeColors:
            continue

        validCount += 1

    return validCount

with open('input.txt') as file:
    data = file.read()
            
    print(part1(data))
    print(part2(data))
