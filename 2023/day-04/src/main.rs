
fn part1(input: &str) -> String {
    let mut sum = 0;

    for line in input.lines() {
        
        if !line.starts_with("Card ") {
            continue;
        }

        let parts: Vec<&str> = line.split(": ").collect();
        let sides: Vec<&str> = parts[1].split(" | ").collect();

        let winning_numbers: Vec<i32> = sides[0]
            .split(' ')
            .filter(|s| !s.is_empty())
            .map(|s| s.parse().unwrap())
            .collect();
        
        let our_numbers: Vec<i32> = sides[1]
            .split(' ')
            .filter(|s| !s.is_empty())
            .map(|s| s.parse().unwrap())
            .collect();
        
        let intersect: Vec<i32> = our_numbers
            .into_iter()
            .filter(|x| winning_numbers.contains(x))
            .collect();

        if !intersect.is_empty() {
            let count = (intersect.len() as i32) - 1;
            let points = 2_i32.pow(count as u32);
            sum += points;
        }
    }
    
    return sum.to_string();
}

fn process(cards: &Vec<i32>, index: usize) -> i32 {
    let begin = index + 1;
    let end = index + 1 + (cards[index] as usize);

    let mut count = 1;
    for i in begin..end {
        count += process(cards, i);
    }
    return count;
}

fn part2(input: &str) -> String {

    let mut cards = Vec::<i32>::new();

    for line in input.lines() {
        
        if !line.starts_with("Card ") {
            continue;
        }

        let parts: Vec<&str> = line.split(": ").collect();
        let sides: Vec<&str> = parts[1].split(" | ").collect();

        let winning_numbers: Vec<i32> = sides[0]
            .split(' ')
            .filter(|s| !s.is_empty())
            .map(|s| s.parse().unwrap())
            .collect();
        
        let our_numbers: Vec<i32> = sides[1]
            .split(' ')
            .filter(|s| !s.is_empty())
            .map(|s| s.parse().unwrap())
            .collect();
        
        let intersect: Vec<i32> = our_numbers
            .into_iter()
            .filter(|x| winning_numbers.contains(x))
            .collect();

        let count = intersect.len() as i32;
        cards.push(count);
    }

    let mut sum = 0;

    for i in 0..cards.len() {
        sum += process(&cards, i);
    }
    
    return sum.to_string();
}

fn main() {
    let input = include_str!("../input.txt");
//     let input = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
// Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
// Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
// Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
// Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
// Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11";

    println!("Part 1: {}", part1(input));
    println!("Part 2: {}", part2(input));
}
