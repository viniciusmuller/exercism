def is_isogram(string):
    word = string.replace(' ', '').replace('-', '')
    return len(word) == len(set(word.lower()))
