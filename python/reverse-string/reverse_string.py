def reverse(text):
    # Don't use methods to reverse here, don't be a monster :(
    return ''.join(text[-i-1] for i in range(len(text)))
