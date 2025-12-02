
/* TODO: Return List() or a string array ? */
public fun split(in _string, in _delim, optional in _maxsplit) {
    /*_parts = [];*/
    _parts = List();

    if (!present(_maxsplit)) {
        _maxsplit = len(_string);
    }

    if (len(_delim) > 1) {
        abort();
    }

    _split = scan(_string, _delim);
    while (_split >= 0 && size(_parts) < _maxsplit) {
        _part = extract(0, _split, _string);
        ++_split;
        _string = extract(_split, len(_string) - _split, _string);

        /*_parts = [_parts, _part];*/
        _parts = List(_parts, _part);
        _split = scan(_string, _delim);
    }

    _parts = List(_parts,_string);

    return(_parts);
}