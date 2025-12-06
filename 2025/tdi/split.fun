
/* TODO: Return List() or a string array ? */
public fun split(in _string, optional in _delim, optional in _maxsplit)
{
    if (!present(_maxsplit)) {
        _maxsplit = len(_string);
    }

    if (!present(_delim)) {
        return(splitws(_string, _maxsplit));
    }

    if (len(_delim) > 1) {
        abort();
    }
    
    _parts = [];
    /*_parts = List();*/

    _split = scan(_string, _delim);
    while (_split >= 0 && size(_parts) < _maxsplit) {
        _part = extract(0, _split, _string);
        ++_split;
        _string = extract(_split, len(_string) - _split, _string);

        _parts = [_parts, _part];
        /*_parts = List(_parts, _part);*/
        _split = scan(_string, _delim);
    }

    _parts = [_parts, _part];
    /*_parts = List(_parts,_string);*/

    return(_parts);
}