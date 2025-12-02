
public fun part1() {
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

            _test = extract(0, _length / 2, _string);
            _test //= _test;
            
            if (_string == _test) {
                _sum += _value;
            }
        }
    }

    return(_sum);
}