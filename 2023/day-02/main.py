
def part1(input):
    sum = 0

    for line in input.splitlines():
        if not line.startswith('Game '):
            continue
        line = line[5:]

        parts = line.split(': ')
        game = int(parts[0])

        possible = True

        rounds = parts[1].split('; ')
        for round in rounds:
            red = 0
            green = 0
            blue = 0

            counts = round.split(', ')
            for count in counts:
                pair = count.split()
                amount = int(pair[0])

                if pair[1] == 'red':
                    red += amount
                elif pair[1] == 'green':
                    green += amount
                elif pair[1] == 'blue':
                    blue += amount
            
            if red > 12 or green > 13 or blue > 14:
                possible = False
                break
        
        if possible:
            sum += game
    
    return sum

def part2(input):
    sum = 0

    for line in input.splitlines():
        if not line.startswith('Game '):
            continue
        line = line[5:]

        red = 0
        green = 0
        blue = 0

        parts = line.split(': ')
        rounds = parts[1].split('; ')
        for round in rounds:

            counts = round.split(', ')
            for count in counts:
                pair = count.split()
                amount = int(pair[0])

                if pair[1] == 'red':
                    if amount > red:
                        red = amount
                elif pair[1] == 'green':
                    if amount > green:
                        green = amount
                elif pair[1] == 'blue':
                    if amount > blue:
                        blue = amount

        power = red * green * blue
        sum += power
    
    return sum

input = open('input.txt').read()

print('Part 1:', part1(input))
print('Part 2:', part2(input))