
fn part1(input: &str) -> String {
    let mut sum = 0;

    for mut line in input.lines() {
        
        if !line.starts_with("Game ") {
            continue;
        }
        line = &line[5..];

        let parts: Vec<&str> = line.split(": ").collect();
        let game = parts[0].parse::<i32>().unwrap();

        let mut possible = true;

        let rounds: Vec<&str> = parts[1].split("; ").collect();
        for round in rounds {
            let mut red = 0;
            let mut green = 0;
            let mut blue = 0;

            let counts: Vec<&str> = round.split(", ").collect();
            for count in counts {
                let pair: Vec<&str> = count.split(" ").collect();
                let amount = pair[0].parse::<i32>().unwrap();

                if pair[1] == "red" {
                    red += amount;
                }
                else if pair[1] == "green" {
                    green += amount;
                }
                else if pair[1] == "blue" {
                    blue += amount;
                }
            }
                
            // println!("Red {}, Green {}, Blue {}", red, green, blue);
            if red > 12 || green > 13 || blue > 14 {
                possible = false;
                break;
            }
        }

        if possible {
            sum += game;
        }
    }
    
    return sum.to_string();
}

fn part2(input: &str) -> String {
    let mut sum = 0;

    for line in input.lines() {
        
        if !line.starts_with("Game ") {
            continue;
        }

        let mut red = 0;
        let mut green = 0;
        let mut blue = 0;

        let parts: Vec<&str> = line.split(": ").collect();
        let rounds: Vec<&str> = parts[1].split("; ").collect();
        for round in rounds {

            let counts: Vec<&str> = round.split(", ").collect();
            for count in counts {
                let pair: Vec<&str> = count.split(" ").collect();
                let amount = pair[0].parse::<i32>().unwrap();

                if pair[1] == "red" {
                    if amount > red {
                        red = amount;
                    }
                }
                else if pair[1] == "green" {
                    if amount > green {
                        green = amount;
                    }
                }
                else if pair[1] == "blue" {
                    if amount > blue {
                        blue = amount;
                    }
                }
            }
        }

        let power = red * green * blue;
        sum += power;
    }
    
    return sum.to_string();
}

fn main() {
    let input = include_str!("../input.txt");
//     let input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
// Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
// Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
// Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
// Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green";
    println!("Part 1: {}", part1(input));
    println!("Part 2: {}", part2(input));
}
