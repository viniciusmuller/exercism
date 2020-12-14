
plants = {
    'C': 'Clover',
    'R': 'Radishes',
    'V': 'Violets',
    'G': 'Grass'
}

default_students = ['Alice', 'Bob', 'Charlie', 'David',
                    'Eve', 'Fred', 'Ginny', 'Harriet',
                    'Ileana', 'Joseph', 'Kincaid', 'Larry']

class Garden:
    def __init__(self, diagram, students=default_students):
        students = sorted(students)
        l1, l2 = diagram.split('\n')
        self.garden = {
            stu:[plants[c] for c in l1[i:i+2] + l2[i:i+2]]
            for i, stu in zip(range(0, len(students)*2, 2), students)
        }

    def plants(self, name):
        return self.garden[name]
