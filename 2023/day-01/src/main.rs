
fn part1(input: &str) -> String {
    let mut sum = 0;

    for line in input.lines() {
        let digits: Vec<u32> = line.to_string()
            .chars()
            .filter_map(|x| x.to_digit(10))
            .collect();
        sum += (digits[0] * 10) + digits[digits.len() - 1];
    }

    return sum.to_string();
}

fn part2(input: &str) -> String {
    let mut sum = 0;

    let numbers = [ "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ];

    for mut line in input.lines() {

        let mut digits = Vec::<u32>::new();

        while !line.is_empty() {
            let c = line.chars().next().unwrap();
            if c.is_numeric() {
                digits.push(c.to_digit(10).unwrap());
            }
            else {
                for (n, num) in numbers.iter().enumerate() {
                    if line.starts_with(num) {
                        digits.push((n + 1) as u32);
                    }
                } 
            }
            line = &line[1..];
        }

        sum += (digits[0] * 10) + digits[digits.len() - 1];
    }

    return sum.to_string();
}

fn main() {
    let input = include_str!("../input.txt");
//     let input = "1abc2
// pqr3stu8vwx
// a1b2c3d4e5f
// treb7uchet";
    println!("Part 1: {}", part1(input));
    println!("Part 2: {}", part2(input));
}
