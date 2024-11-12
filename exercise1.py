# exercise1

#  Write a list of the first 100 numbers in which any number divisible 
# by three is replaced by the word “fizz” and any divisible by five by the word “buzz”. 
# Numbers divisible by both become “fizz buzz”.

for num in range(1,100):
    if num % 5 == 0 or num % 3 == 0:
        print("fizzbuzz")
    elif num % 5 ==0:
        print("buzz")
    elif num % 3 ==0:
        print("fizz")
    else:
        print(num)



