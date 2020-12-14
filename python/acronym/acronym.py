def abbreviate(words):
    words = words.replace('-', ' ').replace('_', '')
    return ''.join(w[0].upper() for w in words.split())
