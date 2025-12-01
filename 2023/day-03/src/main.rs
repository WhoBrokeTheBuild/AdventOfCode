
fn part1(input: &str) -> String {
    let mut grid = Vec::<Vec::<char>>::new();

    let lines: Vec<&str> = input.lines().collect();

    for line in lines {
        grid.push(line.chars().collect());
    }

    let offsets: [(i32, i32); 8] = [
        ( -1, -1 ),
        ( -1,  0 ),
        ( -1,  1 ),
        (  0, -1 ),
        (  0,  1 ),
        (  1, -1 ),
        (  1,  0 ),
        (  1,  1 ),
    ];

    let mut sum = 0;

    for y in 0..grid.len() {
        let mut valid = false;
        let mut part = 0;

        for x in 0..grid[y].len() {
            if grid[y][x].is_numeric() {
                part = (part * 10) + grid[y][x].to_digit(10).unwrap();
                
                for offset in offsets {
                    let dx = x as i32 + offset.0;
                    let dy = y as i32 + offset.1;

                    if dy < 0 || dy >= grid[y].len() as i32 || dx < 0 || dx >= grid[y].len() as i32 {
                        continue;
                    }

                    let c = grid[dy as usize][dx as usize];
                    if c != '.' && !c.is_digit(10) {
                        valid = true;
                    }
                }
            }
            else {
                if valid {
                    sum += part;
                }
                
                part = 0;
                valid = false;
            }
        }

        if valid {
            sum += part;
        }
    }

    return sum.to_string();
}

use std::collections::HashMap;

fn part2(input: &str) -> String {
    let mut grid = Vec::<Vec::<char>>::new();

    let lines: Vec<&str> = input.lines().collect();

    for line in lines {
        let mut line2 = String::from(line);
        line2.push('.');
        grid.push(line2.chars().collect());
    }

    let offsets: [(i32, i32); 8] = [
        ( -1, -1 ),
        ( -1,  0 ),
        ( -1,  1 ),
        (  0, -1 ),
        (  0,  1 ),
        (  1, -1 ),
        (  1,  0 ),
        (  1,  1 ),
    ];

    // index -> (count, product)
    let mut gear_ratios: HashMap<i32, (i32, i32)> = HashMap::new();

    for y in 0..grid.len() {
        let mut part = 0;
        let mut gear_index = -1;

        for x in 0..grid[y].len() {
            if grid[y][x].is_numeric() {
                part = (part * 10) + grid[y][x].to_digit(10).unwrap();
                
                for offset in offsets {
                    let dx = x as i32 + offset.0;
                    let dy = y as i32 + offset.1;

                    if dy < 0 || dy >= grid.len() as i32 || dx < 0 || dx >= grid[y].len() as i32 {
                        continue;
                    }

                    let c = grid[dy as usize][dx as usize];
                    if c == '*' {
                        gear_index = (dy * grid[y].len() as i32) + dx;
                    }
                }
            }
            else {
                if gear_index >= 0 {
                    if !gear_ratios.contains_key(&gear_index) {
                        gear_ratios.insert(gear_index, (1, part as i32));
                    }
                    else {
                        let ratio = gear_ratios.get_mut(&gear_index).unwrap();
                        ratio.0 += 1;
                        ratio.1 *= part as i32;
                    }
                }

                gear_index = -1;
                part = 0;
            }
        }
    }

    let mut sum = 0;

    for (_, (count, product)) in gear_ratios {
        if count == 2 {
            sum += product;
        }
    }

    return sum.to_string();
}

fn main() {
    let input = include_str!("../input.txt");
//     let input = "467..114..
// ...*......
// ..35..633.
// ......#...
// 617*......
// .....+.58.
// ..592.....
// ......755.
// ...$.*....
// .664.598..";
    println!("Part 1: {}", part1(input));
    println!("Part 2: {}", part2(input));
}
