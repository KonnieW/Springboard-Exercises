def weekday_name(day_of_week):
    """Return name of weekday.
    
        >>> weekday_name(1)
        'Sunday'
        
        >>> weekday_name(7)
        'Saturday'
        
    For days not between 1 and 7, return None
    
        >>> weekday_name(9)
        >>> weekday_name(0)
    """

    DAYS = [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday",
    ]

    # for day_of_week in DAYS:
    #     if day_of_week == 1:
    #         return "Sunday"

    #     if day_of_week == 7:
    #         return "Saturday"

    #     if day_of_week !=1 and !=7:
    #         return None


    if day_of_week < 1 or day_of_week > 7:
        return None

    return DAYS[day_of_week - 1] 
    #List isn't going backwards, because Sunday normally starts at an index of 0 but they already assigned it as 1 so 
    #it is -1 in order to match up the loop sequence
