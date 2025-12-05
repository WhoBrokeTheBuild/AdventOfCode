
public fun readlines(in _file)
{
    _position = ftell(_file);
    _lastPosition = -1;

    _lines = [];
    while (sizeof(_file) != 0 && _position != _lastPosition) {
        _result = if_error(_line = read(_file),*);
        if (_result == *) {
            _line = '';
        }

        /* Append the new line */
        _lines = [_lines, _line];

        _lastPosition = _position;
        _position = ftell(_file);
    }

    return(_lines);
}