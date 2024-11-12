# Exercise 4: Matrix Calculus in basic Python

# (a) Generate a couple of numerical examples for vectors and matrices. 
# Experiment with the operators + and *. 
# Do they yield the same result as expected from linear algebra?

#벡터 예제
vector1 = [1,2,3]
vector2 = [4,5,6]

#행렬 예제
matrix1 = [[1,2],[3,4]]
matrix2 = [[5,6],[7,8]]

#리스트의 + 연산 결과: 이어붙이기
print("벡터 덧셈 예시:", vector1+vector2)
print("행렬 덧셈 예시:", matrix1+matrix2)

#리스트의 * 연산결과: 반복
print("벡터 곱셈 예시", vector1*2)

# (b) Write a function for the sum of two vectors using list comprehension.
#벡터 합 함수 (리스트 내포 사용)

def sum_vectors(v1,v2):
    return[v1[i]+v2[i] for i in range(len(v1))]

v1 = [1,2,3]
v2 = [4,5,6]

print("벡터 합:",sum_vectors(v1,v2))
# (c) Write a function for the multiplication of a vector by a scalar.

def scalar_multiply(scarlar,vector):
    return [scarlar*element for element in vector]
vector = [1,2,3]
scarlar =3
print("벡터와 스칼라의 곱:", scarlar_multiply(scarlar,vector))

# (d) Write a function for the sum of two matrices using list comprehension.
# 행렬의 합을 구하는 함수
def sum_matrices(m1, m2):
    return [[m1[i][j] + m2[i][j] for j in range(len(m1[0]))] for i in range(len(m1))]

# 예시 행렬
m1 = [[1, 2], [3, 4]]
m2 = [[5, 6], [7, 8]]

# 결과 출력
print("행렬 합:", sum_matrices(m1, m2))

# (e) Write a function for the multiplication of a matrix by a scalar.

def matix_scalar_multiply(scalar,matrix):
    return[[scalar*element for element in row] for row in matrix]

matrix = [[1,2],[3,4]]
scalar = 2
print("행렬과 스칼라의 곱:", matrix_scalar_multiply(scalar,matrix))

# (f) Write a function for the multiplication of two matrices not necessarily square. 
# Raise a ValueError exception if the size of the matrices is not compliant.

def multiply_matrices(m1,m2):
    if len(m1[0]) != len(m2):
        raise ValueError("행렬의 내적 크기가 일치않습니다")
    
    result = [[sum(m1[i][k]*m2[k][j] for k in range(len(m2))) for j in range(len(m2[0]))] for i in range(len(m1))]
    return result

m1 = [[1,2],[3,4]]
m2 = [[5,6],[7,8]]

print("행렬의 곱:", multiply_matrices(m1,m2))

