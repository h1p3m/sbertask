def max_concatenated_number(lst):
    # Sort the list of strings in descending order based on the concatenated value
    sorted_list = sorted(lst, key=lambda x: x*3, reverse=True)
    # Concatenate the sorted strings and return the resulting integer
    return int(''.join(sorted_list))


# example 11, 234, 005, 89

print (max_concatenated_number(['11', '234', '005', '89']))
print (max_concatenated_number(['42', '807', '99', '29']))

