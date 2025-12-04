
public fun part1() {
    _file = fopen("input.txt", "r");
    _data = read(_file);
    fclose(_file);

    _sum = 0QU;

    _i = 0;
    _part = element(_i++, ',', _data);
    while (len_trim(_part) > 0) {
        _split = scan(_part, '-');

        _min = parseint(extract(0, _split, _part));
        _max = parseint(extract(_split + 1, len(_part) - _split - 1, _part));

        for (_id = _min; _id <= _max; ++_id) {
            _value = _id;

            _string = trim(adjustl(_value));
            _length = len(_string);

            _test = extract(0, _length / 2, _string);
            _test //= _test;
            
            if (_string == _test) {
                _sum += _value;
            }
        }

        _part = element(_i++, ',', _data);
    }

    return(_sum);
}