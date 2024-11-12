#가우스 소거법을 사용하여 선형 시스템 Ax=b를 풀기
#이해 못함. 나중에 다시 풀기
import numpy as np

def custom_gaussian_elimination(A, b):
    # 행렬 A와 벡터 b를 결합하여 확장 행렬 생성
    Ab = np.column_stack((A, b))

    # 행의 수 구하기
    num_rows = len(Ab)

    # 전방 소거 과정
    for i in range(num_rows):
        # i번째 열에서 i번째 행 이하를 포함하는 부분에서 절대값이 최대인 행을 찾음
        max_row_index = np.argmax(np.abs(Ab[i:, i])) + i
        # 최대 행과 i번째 행을 교환
        Ab[[i, max_row_index]] = Ab[[max_row_index, i]]
        # 피봇 행을 피봇 값으로 나누어 피봇을 1로 만듦
        Ab[i] /= Ab[i, i]
        
        # i번째 행을 사용하여 다른 모든 행의 i번째 열을 0으로 만듦
        for j in range(num_rows):
            if i != j:
                factor = Ab[j, i] / Ab[i, i]
                Ab[j] -= factor * Ab[i]

    # 마지막 열에서 해 추출
    return Ab[:, -1]

# 주어진 행렬 A와 벡터 b
A = np.array([[3, 1, 1], [2, 4, 1], [2, 1, 2]])
b = np.array([2, 2, 1])

# 가우스 소거법 함수를 호출하여 해 구하기
solution = custom_gaussian_elimination(A, b)
print("Solution:", solution)
