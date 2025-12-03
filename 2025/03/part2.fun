
public fun part2() {
    _file = fopen("input.txt", "r");
    _lines = readlines(_file);
    fclose(_file);

    _total = 0Q;

    for (_i = 0; _i < size(_lines); ++_i) {
        _line = _lines[_i];
        _size = len(_line);

        _digits = '0';
        for (_j = 0; _j < _size; ++_j) {
            _c = extract(_j, 1, _line);

            _start = max(0, 12 - (_size - _j));
            for (_k = _start; _k < 12; ++_k) {
                _d = extract(_k, 1, _digits);
                if (_c > _d) {
                    _digits = extract(0, _k, _digits) // _c;
                    break;
                }
            }
        }

        _string = join(_digits, '');
        _total += parseint(_string);
    }

    return(_total);
}