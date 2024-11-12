#  NumPy와 SciPy 라이브러리를 사용한 행렬 연산

import numpy as np

#무작위 행렬 A와 B 생성
np.random.seed(0) #결과 일관성을 위한 시드 설정

A = np.random.randint(1,11,size=(3,2))
B = np.random.randint(1,11,size=(2,4))

# a) A + B, A - B
# A와 B는 크기가 다르므로 직접 덧셈과 뺄셈을 수행할 수 없음

# b) A · B (행렬 곱)
AB = np.dot(A,B) #행렬 A와 B의 곱

# c) A / B (원소별 나눗셈)
# A와 B는 크기가 다르므로 원소별 나눗셈을 수행할 수 없음

print("행렬 A:")
print(A)
print("\n행렬 B:")
print(B)
print("\n행렬 A와 B의 곱 AB:")
print(AB)
