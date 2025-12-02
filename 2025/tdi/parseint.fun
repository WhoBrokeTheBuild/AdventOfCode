
/* TODO: numeric limits */
public fun parseint(in _string)
{
    _result = 0Q;
    for (_i = 0; _i < len(_string); ++_i) {
        _c = extract(_i, 1, _string);

        /* isdigit(_c) */
        if (_c < '0' || _c > '9') {
            break;
        }

        /* '3' - '0' = 3 */
        _digit = iachar(_c) - iachar('0');

        /* TODO: Adjustable base? */
        _result = (_result * 10) + _digit;
    }

    return(_result);
}