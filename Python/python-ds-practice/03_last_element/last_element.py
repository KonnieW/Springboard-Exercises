def last_element(lst):
    """Return last item in list (None if list is empty.
    
        >>> last_element([1, 2, 3])
        3
        
        >>> last_element([]) is None
        True
    """
    #previous attempt
    # NUMBERS = [1,2,3,4,5]

    # return NUMBERS[lst - 1]

    if lst:
        return lst[-1]


    # we don't need to do anything else; functions return None by default
    # Because there isn't a given list of objects, the function just tests on whatever runs through it
    # So no matter what tests you run through it will be true    