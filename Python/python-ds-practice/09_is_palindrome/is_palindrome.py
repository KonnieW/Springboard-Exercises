def is_palindrome(phrase):
    """Is phrase a palindrome?

    Return True/False if phrase is a palindrome (same read backwards and
    forwards).

        >>> is_palindrome('tacocat')
        True

        >>> is_palindrome('noon')
        True

        >>> is_palindrome('robert')
        False

    Should ignore capitalization/spaces when deciding:

        >>> is_palindrome('taco cat')
        True

        >>> is_palindrome('Noon')
        True
    """
    # return phrase == phrase.lower()[::-1]

    # if is_palindrome:
    #     return True
    # else:
    #     return False


    word = phrase.lower().replace(' ', '')  #transforming all text to lowercase and replacing empty spaces with no spaces
    return word == word[::-1] #slice method reversed; checking that the word is the same contents but reversed

    
