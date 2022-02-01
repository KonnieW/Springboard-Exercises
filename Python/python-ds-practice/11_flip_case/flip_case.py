def flip_case(phrase, to_swap):
    """Flip [to_swap] case each time it appears in phrase.

        >>> flip_case('Aaaahhh', 'a')
        'aAAAhhh'

        >>> flip_case('Aaaahhh', 'A')
        'aAAAhhh'

        >>> flip_case('Aaaahhh', 'h')
        'AaaaHHH'

    """
    to_swap = to_swap.lower()           #to_swap equals to all lower cased letters
    out = ""                            # empty string placeholder like empty [] or {}

    for ltr in phrase:                  #for loop, iterating over each letter in the phrase
        if ltr.lower() == to_swap:      #if the lower case letter has the same contents as lower case to_swap
            ltr = ltr.swapcase()        #swapcase method changes lower case to upper case and vice versa
        out += ltr                      

    return out



         
    # out = ""                            Why doesn't this way work? Because it needs something to compare against
    # for to_swap in phrase:                  
    #     if to_swap = to_swap.lower():     
    #         ltr = to_swap.swapcase()        
    #     out += ltr                      
    # return out