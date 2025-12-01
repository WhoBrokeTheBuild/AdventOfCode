
struct Range {
    out_start: i64,
    in_start: i64,
    length: i64,
}

fn part1(input: &str) -> String {

    let mut seeds = Vec::<i64>::new();
    let mut ranges = Vec::<Range>::new();

    let mut lines: Vec<&str> = input.lines().collect();
    lines.push("final map:");

    for line in lines {

        if line.is_empty() {
            continue;
        }

        if line.starts_with("seeds: ") {
            seeds = line[7..]
                .split(' ')
                .map(|s| s.parse().unwrap())
                .collect();
        }
        else if line.ends_with("map:") {
            for seed in &mut seeds {
                for range in &ranges {
                    if *seed >= range.in_start && *seed <= (range.in_start + range.length) {
                        // let old_seed = *seed;
                        *seed = range.out_start + (*seed - range.in_start);
                        // println!("{} => {}", old_seed, *seed);
                        break;
                    }
                }
            }
            // println!();

            ranges.clear();
        }
        else {
            let numbers: Vec<i64> = line
                .split(' ')
                .map(|s| s.parse().unwrap())
                .collect();

            if numbers.len() < 3 {
                // die?
            }

            ranges.push(Range {
                out_start: numbers[0],
                in_start: numbers[1],
                length: numbers[2],
            });
        }

    }

    let min = seeds.iter().min().unwrap();
    return min.to_string();
}

fn part2(input: &str) -> String {

    let mut seeds = Vec::<i64>::new();
    let mut ranges = Vec::<Range>::new();

    let mut lines: Vec<&str> = input.lines().collect();
    lines.push("final map:");

    for line in lines {

        if line.is_empty() {
            continue;
        }

        if line.starts_with("seeds: ") {
            let seed_ranges: Vec<i64> = line[7..]
                .split(' ')
                .map(|s| s.parse().unwrap())
                .collect();

            for pair in seed_ranges.chunks(2) {
                let start = pair[0];
                let end = pair[0] + pair[1];
                for i in start..end {
                    seeds.push(i);
                }
            }

            println!("length {}", seeds.len());
        }
        else if line.ends_with("map:") {
            for seed in &mut seeds {
                for range in &ranges {
                    if *seed >= range.in_start && *seed <= (range.in_start + range.length) {
                        // let old_seed = *seed;
                        *seed = range.out_start + (*seed - range.in_start);
                        // println!("{} => {}", old_seed, *seed);
                        break;
                    }
                }
            }
            // println!();

            println!("{}", line);

            ranges.clear();
        }
        else {
            let numbers: Vec<i64> = line
                .split(' ')
                .map(|s| s.parse().unwrap())
                .collect();

            if numbers.len() < 3 {
                // die?
            }

            ranges.push(Range {
                out_start: numbers[0],
                in_start: numbers[1],
                length: numbers[2],
            });
        }

    }

    let min = seeds.iter().min().unwrap();
    return min.to_string();
}

fn main() {
    let input = include_str!("../input.txt");
//     let input = "seeds: 79 14 55 13

// seed-to-soil map:
// 50 98 2
// 52 50 48

// soil-to-fertilizer map:
// 0 15 37
// 37 52 2
// 39 0 15

// fertilizer-to-water map:
// 49 53 8
// 0 11 42
// 42 0 7
// 57 7 4

// water-to-light map:
// 88 18 7
// 18 25 70

// light-to-temperature map:
// 45 77 23
// 81 45 19
// 68 64 13

// temperature-to-humidity map:
// 0 69 1
// 1 0 69

// humidity-to-location map:
// 60 56 37
// 56 93 4";

    println!("Part 1: {}", part1(input));
    println!("Part 2: {}", part2(input)); // Wrong??
}
