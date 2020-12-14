
values = {}

def update(target, value):
    for c in target:
        values.update({c:value})

# Creating a unique key for each character, in order to prevent
# unneficient iterations on the algorithm itself
update('AEIOULNRST', 1)
update('DG', 2)
update('BMCP', 3)
update('FHVWY', 4)
update('K', 5)
update('JX', 8)
update('QZ', 10)

def score(word):
    result = 0
    for c in word.upper():
        result += values.get(c, 0)

    return result
