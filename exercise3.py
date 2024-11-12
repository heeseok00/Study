# Exercise 3: Python: One liner quizzes
# Write a one line Python code for the following tasks:

# (a) Construct the set S = { x ∈ R | x ≥ 0 ∧ x mod 3 = 1 }
# 집합 S는 0보다 크거나 같은 모든 실수 X 중에서, 3으로 나누었을 때 나머지가 1인 수들을 포함하는 집합.

S = {x for x in range(101) if x >=0 and x % 3 ==1}
print(S)

# (b) Using list comprehension make a list for {(i, j) | i ∈ {1, 2, 3, 4}, j ∈ {5, 7, 9}}

result = [(i,j) for i in {1,2,3,4} for j in {5,7,9}]
print(result)

# (c) Calculate the inverse of a function or the index function for an invertible function given in the form of a dictionary
#주어진 딕셔너리에서 값과 키가 바뀐 새로운 딕셔너리를 생성하는 것. 이를 딕셔너리의 역함수 또는 인덱스 함수 계산이라고 함.

original_dict = {'a':1,'b':2,'c':3}
inverted_dict = {1:'a',2:'b',3:'c'}
print(inverted_dict)

# (d) What is the result of the following lines?
#     map(lambda x: x % 3, range(5))
#     filter(lambda x: x % 2 == 0, range(5))

result_map = list(map(lambda x: x % 3,range(5)))
print(result_map)

result_filter = list(map(lambda x: x%2 ==0,range(5)))
print(result_filter)
                    

