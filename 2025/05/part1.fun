
public fun part1() {
    _file = fopen("input.txt", "r");
    _lines = readlines(_file);
    fclose(_file);

    _count = 0Q;

    _mins = [];
    _maxs = [];

    _readingRanges = $true;
    for (_i = 0; _i < size(_lines); ++_i) {
        _line = _lines[_i];

        if (len_trim(_line) == 0) {
            _readingRanges = $false;
            continue;
        }

        if (_readingRanges) {
            _min = parseint(element(0, '-', _line));
            _max = parseint(element(1, '-', _line));

            _mins = [_mins, _min];
            _maxs = [_maxs, _max];
        }
        else {
            _id = parseint(_line);

            _lower = (_id >= _mins);
            _upper = (_id <= _maxs);

            if (any(_lower && _upper)) {
                ++_count;
            }
        }
    }

    return(_count);
}