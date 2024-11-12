# 문제는 3x3 행렬 A와 3x1 벡터 b가 주어졌을 때, 이를 이용한 선형 시스템 Ax = b를 
# 가우스 소거법(Gaussian elimination)을 사용하여 해결하기

import numpy as np

#Define the Matrix A and vector b

A=np.array([[3,1,1],[2,4,1],[2,1,2]])

b=np.array([2,2,1])

AA=np.column_stack((A,b))

#가우스 소거법을 통한 행 연산
#첫 번째 행을 기준으로 두 번째와 세 번째 행을 조정.

factor = AA[1, 0] / AA[0, 0]
AA[1, :] -= factor * AA[0, :]
factor = AA[2, 0] / AA[0, 0]
AA[2, :] -= factor * AA[0, :]

# 두 번째 행을 기준으로 세 번째 행을 조정
factor = AA[2, 1] / AA[1, 1]
AA[2, :] -= factor * AA[1, :]

print("Reduced Matrix:\n", AA)

# 역대입을 통한 해 구하기
x = np.zeros(3)
x[2] = AA[2, 3] / AA[2, 2]
x[1] = (AA[1, 3] - AA[1, 2] * x[2]) / AA[1, 1]
x[0] = (AA[0, 3] - AA[0, 2] * x[2] - AA[0, 1] * x[1]) / AA[0, 0]

print("Solution:", x)