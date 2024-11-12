#Exercise 2 Data Types

#Revise the difference between the main data types in Python: list, tuples, dictionaries and sets.
#  Write an example for each of them in which you define and initialize a variable for each type 
# and then print the content looping through the elements of the variable.

#list example
my_list = [10,20,30,40,50,60]
for i in my_list:
    print(i)

#tuples example
my_tuple = (1,2,3,4,5,6,7,8,9)
for i in my_tuple:
    print(i)

#dictionaries example
my_dict ={'name':'Benji', 'age': 23, "Occupation": "Undergraduate"}
for key,val in my_dict.items():
    print("My {} is {}".format(key,val))


#sets example
my_set = {20,30,40,50,60,20,30,40,50}
for i in my_set:
    print(i)
