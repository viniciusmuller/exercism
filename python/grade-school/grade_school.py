from itertools import chain

class School:
    def __init__(self):
        # Self.students is a data structure containing
        # {grade_number: [students]}
        self.students = {}

    def add_student(self, name, grade):
        if not self.students.get(grade):
            self.students[grade] = [name]
            return

        self.students[grade].append(name)

    def roster(self):
        # Sorting all available grades
        grades = sorted(self.students.keys())
        # Creating a list of sorted students per grade
        students = [sorted(self.students[g]) for g in grades]
        # And chaining it in order to return
        return list(chain.from_iterable(students))

    def grade(self, grade_number):
        return sorted(self.students.get(grade_number, []))
