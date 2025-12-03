
public fun part1() {
    _file = fopen("input.txt", "r");
    _lines = readlines(_file);
    fclose(_file);

    _total = 0;

    for (_i = 0; _i < size(_lines); ++_i) {
        _line = _lines[_i];

        _ones = '';
        _tens = '';
        for (_j = 0; _j < len(_line) - 1; ++_j) {
            _c = extract(_j, 1, _line);

            if (_c > _tens) {
                _tens = _c;
                _ones = '';
            }
            else if (_c > _ones) {
                _ones = _c;
            }
        }

        _c = extract(_j, 1, _line);
        if (_c > _ones) {
            _ones = _c;
        }

        _total += parseint(_tens // _ones);
    }

    return(_total);
}