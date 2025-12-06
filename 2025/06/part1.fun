
public fun part1() {
    _file = fopen("input.txt", "r");
    _lines = readlines(_file);
    fclose(_file);

    _numbers = [];
    for (_i = 0; _i < size(_lines) - 2; ++_i) {
        _line = adjustl(_lines[_i]);
        _parts = split(_line);

        _row = [];

        for (_j = 0; _j < size(_parts); ++_j) {
            if (len_trim(_parts[_j]) == 0) {
                continue;
            }

            _num = parseint(_parts[_j]);
            _row = [_row, _num];
        }

        _numbers = [_numbers, _row];
    }

    _count = 0Q;

    _operators = split(_lines[size(_lines) - 2]);
    for (_i = 0; _i < size(_operators); ++_i) {
        _op = _operators[_i];
        if (_op == '+') {
            _count += sum(_numbers[_i]);
        }
        else if (_op == '*') {
            _count += product(_numbers[_i]);
        }
    }

    return(_count);
}