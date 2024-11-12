def multiply_matrices(m1,m2):
    if len(m1[0]) != len(m2):
        raise ValueError("행렬의 내적 크기가 일치않습니다")
    
    result = [[sum(m1[i][k]*m2[k][j] for k in range(len(m2))) for j in range(len(m2[0]))] for i in range(len(m1))]
    return result

m1 = [[1,2],[3,4]]
m2 = [[5,6],[7,8]]

print("행렬의 곱:", multiply_matrices(m1,m2))