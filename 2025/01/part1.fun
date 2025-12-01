
public fun part1() {
    _file = fopen("input.txt", "r");
    _lines = readlines(_file);
    fclose(_file);

    _count = 0;
    _rotation = 50;
    for (_i = 0; _i < size(_lines); ++_i) {
        _line = _lines[_i];

        /* L is -1, R is +1 */
        _direction = 1;
        if (extract(0, 1, _line) == "L") {
            _direction = -1;
        }

        /* Extract the 35 from L35 */
        _amount = extract(1, len(_line) - 1, _line);
        _amount = parseint(_amount) % 100;

        /* Compute the new rotation */
        _rotation += (_amount * _direction);

        /* Adjust back to [0,99] */
        if (_rotation < 0) {
            _rotation += 100;
        }
        if (_rotation > 99) {
            _rotation -= 100;
        }

        /* Count the number of times it's zero */
        if (_rotation == 0) {
            ++_count;
        }
    }

    return(_count);
}