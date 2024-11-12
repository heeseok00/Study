--1 주어진 정수 n까지의 제곱의 합을 계산하는 함수
sumofsquares :: Int -> Int
sumofsquares n = sum [x^2 | x <- [1..n]]

--2 문자열 리스트에서 각 문자열의 길이를 계산하는 함수
lengths :: [String] -> [Int]
lengths strs = [length st| st <- strs]

--3 주어진 값을 n번 복제하여 리스트로 만드는 함수
replicate' :: Int -> a -> [a]
replicate' n val = [val |_ <- [1..n]]

--4 주어진 문자열에서 모음만 반환하는 함수
--이 함수는 주어진 문자열 str에서 모음(대문자 포함)을 추출하여 새로운 문자열로 반환함.
--리스트 컴프리헨션을 사용하여 문자열 str을 순회하면서 각 문자가 모음인지 확인함.
--elem 함수를 사용하여 해당 문자가 모음 리스트에 있는지 검사한 후, 모음이면 새로운 리스트에 추가함.


vowels :: String -> String
vowels str = [ch |ch <- str, ch `elem` "aeiouAEIOU"] 

--5 주어진 문자열 리스트에서 모음이 정확히 두 개 들어 있는 문자열만 찾는 함수
-- 문자열에서 모음의 개수를 세는 보조 함수
twovowels :: [String] -> [String]
twovowels strs = [str | str <- strs, length (vowels str) == 2]
    where
        vowles str = [ch | ch <- str,ch `elem` "aeiouAEIOU"]

--6 문자열 리스트에서 모음을 제거하는 함수
removevowels :: [String] -> [String]
removevowels strs = [[ch | ch <- str, ch `notElem` "aeiouAEIOU"] | str <- strs]

--7 피타고라스 수(Pythagorean triples)를 찾는 함수

pyths :: Int -> [(Int,Int,Int)]
pyths n = [(x,y,z) | x <-[1..n], y <- [1..n], z <-[1..n],x^2+y^2 ==z^2]

--8 두 정수 리스트의 스칼라 곱을 계산하는 함수 
scalarproduct :: [Int] -> [Int] -> Int 
--첫 번째로 [1,2,3]과 같은 정수 리스트를 입력받고, 두 번째로 [4,5,6]과 같은 정수 리스트를 입력받음.
--이후 두 정수 리스트의 스칼라곱을 계산한 후 Int 타입의 정수로 반환하여 출력함.
scalarproduct xs ys = sum [x*y | (x,y)<- zip xs ys]
--xs와 ys는 매개변수로 각각 정수 리스트 [Int]를 의미함.
--zip 함수는 두 리스트 xs와 ys를 입력으로 받아, 각 요소를 '쌍 (pair)'로 묶은 새로운 리스트를 반환.
--e.g xs =[1,2,3], ys=[4,5,6] / zip xs ys = [(1,4),(2,5),(3,6)]
--(x,y) <- zip xs ys는 zip xs ys의 각 쌍을 x와 y로 분해해서 사용할 수 있게 함.

--9 Caesar Ciper (문자열의 각 문자를 주어진 숫자만큼 오른쪽으로 이동시켜 암호화하는 방법)
encode :: Int -> String -> String
encode n str = [] --(보류)

--10 map 함수가 리스트 내포를 사용하여 구현할 수 있음을 보여주는 문제.
mymap :: (a->b)-> [a]->[b]
mymap f xs = [f x | x <- xs]
--mymap 함수는 두 개의 매개변수를 받음.
--f는 각 리스트 요소에 적용할 함수 (a->b) 임.
--xs는 함수가 적용될 리스트 [a] 임.
--리스트 내포 [f x | x -> xs]를 사용하여 xs의 각 요소 x에 대해 f x를 계산하고 그 결과를 새로운 리스트에 포함시킴.
--e.g. f=(+1)이고 xs=(1,2,3)이면 f x는 각 2,3,4가 되고, 최종 결과는 [2,3,4]가 됨.

--11 자연수의 모든 쌍을 안티대각선 순서 (antidiagonal order)로 나열 (보류)

--12 RPG 전리품 문제 (보류)