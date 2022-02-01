def compact(lst):
    """Return a copy of lst with non-true elements removed.

        >>> compact([0, 1, 2, '', [], False, (), None, 'All done'])
        [1, 2, 'All done']
    """

    # if lst == False.remove()
    #     return lst

    return [val for val in lst if val]    #if value = true do operation and return otherwise ignore