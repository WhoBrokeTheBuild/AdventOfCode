
public fun part1() {
    _file = fopen("input.txt", "r");
    _lines = readlines(_file);
    fclose(_file);

    _cols = size(_lines) + 2;
    _rows = len(_lines[0]) + 2;

    _grid = replicate([$false], 0, _cols);

    for (_i = 0; _i < size(_lines); ++_i) {
        _line = _lines[_i];
        _grid = [_grid, $false];
        for (_j = 0; _j < len(_line); ++_j) {
            _c = extract(_j, 1, _line);
            _grid = [_grid, (_c == '@')];
        }
        _grid = [_grid, $false];
    }

    _grid = [_grid, replicate([$false], 0, _cols)];
    _grid = reshape2(_grid, [_cols, _rows]);

    _count = 0;
    for (_row = 1; _row < _rows - 1; ++_row) {
        for (_col = 1; _col < _cols - 1; ++_col) {
            if (_grid[_col, _row]) {
                _adjacent = [
                    _grid[_col,     _row - 1], /* Top */
                    _grid[_col,     _row + 1], /* Bottom */
                    _grid[_col - 1, _row    ], /* Left */
                    _grid[_col + 1, _row    ], /* Right */
                    _grid[_col - 1, _row - 1], /* Top-Left */
                    _grid[_col + 1, _row - 1], /* Top-Right */
                    _grid[_col - 1, _row + 1], /* Bottom-Left */
                    _grid[_col + 1, _row + 1]  /* Bottom-Right */
                ];

                if (count(_adjacent) < 4) {
                    ++_count;
                }
            }
        }
    }

    return(_count);
}