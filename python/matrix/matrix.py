class Matrix:
    def __init__(self, matrix_string):
        self.m = self._parse_matrix(matrix_string)

    def row(self, index):
        return self.m[index-1]

    def column(self, index):
        return [row[index-1] for row in self.m]

    def _parse_matrix(self, matrix):
        rows = matrix.split('\n')
        cols = [[int(n) for n in row.split()] for row in rows]
        return cols
