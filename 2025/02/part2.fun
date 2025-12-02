
public fun part2() {
    _file = fopen("input.txt", "r");
    _data = read(_file);
    fclose(_file);

    _sum = 0QU;

    _parts = split(_data, ",");
    for (_i = 0; _i < size(_parts); ++_i) {
        _part = _parts[_i];
        _split = scan(_part, '-');

        _min = parseint(extract(0, _split, _part));
        _max = parseint(extract(_split + 1, len(_part) - _split - 1, _part));

        for (_id = _min; _id <= _max; ++_id) {
            _value = _id;

            _string = trim(adjustl(_value));
            _length = len(_string);

            for (_repeat = 2; _repeat <= _length; ++_repeat) {
                if (_length % _repeat == 0) {
                    _test = extract(0, _length / _repeat, _string);
                    _test = repeat(_test, _repeat);

                    if (_string == _test) {
                        _sum += _value;
                        break;
                    }
                }
            }
        }
    }

    return(_sum);
}