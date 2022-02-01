def multiply_even_numbers(nums):
    """Multiply the even numbers.
    
        >>> multiply_even_numbers([2, 3, 4, 5, 6])
        48
        
        >>> multiply_even_numbers([3, 4, 5])
        4
        
    If there are no even numbers, return 1.
    
        >>> multiply_even_numbers([1, 3, 5])
        1
    """

    # evens = [x * x for x in nums if x % 2 == 0]
    # return evens
    # else x % 2 != 0:
    # return 1

    product = 1      

    for num in nums:
        if num % 2 == 0:
            product = product * num

    return product

#doesn't it return an else statement to return 1 if odd numbers? 
#1 is the default setting that's why