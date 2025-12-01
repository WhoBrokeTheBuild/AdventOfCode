
public fun part2() {
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
        _amount = parseint(_amount);

        _startAtZero = (_rotation == 0);

        /* Compute the new rotation */
        _rotation += (_amount * _direction);

        /* Count the number of times we pass zero */
        _passCount = 0;

        /* Adjust back to [0,99] */
        while (_rotation < 0) {
            _rotation += 100;
            ++_passCount;

            /* If we started on 0 and we're going left, don't count it twice */
            if (_startAtZero) {
                --_passCount;
                _startAtZero = $false;
            }
        }
        while (_rotation > 99) {
            _rotation -= 100;
            ++_passCount;

            /* If we ended on 0 and we're going right, don't count it twice */
            if (_rotation == 0) {
                --_passCount;
            }
        }

        /* Count the number of times it's landed on zero */
        if (_rotation == 0) {
            ++_count;

        }

        /* Add the number of times we passed zero to the total count */
        _count += _passCount;
    }

    return(_count);
}