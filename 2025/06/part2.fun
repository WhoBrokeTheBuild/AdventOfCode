
public fun part2() {
    _file = fopen("input.txt", "r");
    _lines = readlines(_file);
    fclose(_file);

    _column = [];
    _numbers = List();
    for (_i = 0; _i < len(_lines[0]); ++_i) {
        _string = '';
        for (_j = 0; _j < size(_lines) - 2; ++_j) {
            _string //= extract(_i, 1, _lines[_j]);
        }

        if (len_trim(_string) == 0) {
            _numbers = List(_numbers, _column);
            _column = [];
        }
        else {
            _number = parseint(adjustl(_string));
            _column = [_column, _number];
        }
    }

    _numbers = List(_numbers, _column);

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