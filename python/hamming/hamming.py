def distance(strand_a, strand_b):

    if len(strand_a) != len(strand_b):
        raise ValueError("A and B lenght must be the same length.")

    hd = 0
    for a, b in zip(strand_a, strand_b):
        if a != b:
            hd += 1

    return hd
