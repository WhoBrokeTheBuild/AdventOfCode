
public fun part2() {
    _file = fopen("input.txt", "r");
    _lines = readlines(_file);
    fclose(_file);

    _count = 0Q;

    _ranges = [];

    for (_i = 0; _i < size(_lines); ++_i) {
        _line = _lines[_i];

        if (len_trim(_line) == 0) {
            break;
        }

        _min = parseint(element(0, '-', _line));
        _max = parseint(element(1, '-', _line));

        _ranges = [_ranges, [_min, _max]];
    }

    _indices = flatten(sort(_ranges[0]));

    _lastMin = -1;
    for (_i = 0; _i < size(_indices); ++_i) {
        _index = _indices[_i];
        _min = _ranges[0,_index];
        _max = _ranges[1,_index];

        if (_lastMin < _min - 1) {
            _lastMin = _min - 1;
        }

        if (_lastMin < _max) {
            _count += (_max - _lastMin);
            _lastMin = _max;
        }
    }

    return(_count);
}