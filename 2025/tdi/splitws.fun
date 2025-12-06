
/* TODO: Return List() or a string array ? */
public fun splitws(in _string, optional in _maxsplit)
{
    if (!present(_maxsplit)) {
        _maxsplit = len(_string);
    }

    _parts = [];

    _start = -1;
    for (_i = 0; _i < len(_string); ++_i) {
        _c = extract(_i, 1, _string);
        _ws = any(_c == [' ', '\t', '\n', '\r']);

        if (_start < 0 && !_ws) {
            _start = _i;
        }
        else if (_start >= 0 && _ws) {
            _part = extract(_start, _i - _start, _string);
            _parts = [_parts, _part];
            _start = -1;
        }
    }

    if (_start >= 0) {
        _part = extract(_start, len(_string) - _start, _string);
        _parts = [_parts, _part];
    }

    return(_parts);
}