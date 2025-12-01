
def part1(input):
    sum = 0
    for line in input.splitlines():
        digits = []
        for c in line:
            if c.isnumeric():
                digits.append(int(c))
        sum += (digits[0] * 10) + digits[-1]
    
    return sum

def part2(input):
    sum = 0
    numbers = [ 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' ]
    for line in input.splitlines():
        digits = []
        for i in range(len(line)):
            if line[i].isnumeric():
                digits.append(int(line[i]))
            else:
                for n, num in enumerate(numbers):
                    if line[i:].startswith(num):
                        digits.append(n + 1)
        sum += (digits[0] * 10) + digits[-1]
    
    return sum


input = open('input.txt').read()

print('Part 1:', part1(input))
print('Part 2:', part2(input))