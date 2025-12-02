
public fun join(in _array, in _delim, optional in _trim) {
    _result = "";

    if (!present(_trim)) {
        _trim = $true;
    }

    _size = size(_array);
    for (_i = 0; _i < _size; ++_i) {
        _element = _array[_i];
        if (_trim) {
            _element = trim(adjustl(text(_element)));
        }
        _result //= _element;
        if (_i < _size - 1) {
            _result //= _delim;
        }
    }

    return(_result);
}