
public fun readlines(in _file)
{
    _lines = [];
    while (sizeof(_file) != 0) {
        _result = if_error(_line = read(_file),*);
        if (_result == *) {
            break;
        }

        /* Append the new line */
        _lines = [_lines, _line];
    }

    return(_lines);
}