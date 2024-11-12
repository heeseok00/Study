module F1 where

{-

  DM580, LECTURE 1: FIRST STEPS IN HASKELL
  ===========================================

-}



-- Course information.

teachers = [
    ("Robin Kaarsgaard Sales", "course head",
     "kaarsgaard@imada.sdu.dk"),
    ("Thomas Wulff Heissel", "TA",
     "thhei20@student.sdu.dk")
  ]









  

textbook = ("Graham Hutton",
            "Programming in Haskell, Second Edition",
            "Cambridge University Press", 2016)










homepage = "https://sdu.itslearning.com/"











courseplan =
  "See the plan on the course homepage for all planned " ++
  "activities, including reading material associated with " ++
  "each lecture. Note that scheduled activities may appear " ++
  "in the calendar that will not be used (I cannot change the " ++
  "course calendar), so please check the course plan before " ++
  "each lecture to avoid showing up unnecessarily."









programmingcourse =
  "This is a programming course. You do well in the course by " ++
  "showing that you're good at programming in Haskell, including " ++
  "reflecting about style, correctness, and performance."







workload = "5 ECTS (~135 hours)."











exam =
  "Individual project graded on the 7-step scale, to be " ++
  "completed in December. More information about the project " ++
  "will follow as we approach the project start."

















-- Installing and running Haskell.

ghcup = "https://www.haskell.org/ghcup/"

ghc = "The Glorious Haskell Compiler. Use runhaskell to run a " ++
  "Haskell program, ghc to compile it, and ghci to develop and " ++
  "test code."

repl = "read-evaluate-print loop"

editor = "Use whatever you like. If you use VS Code, install the " ++
  "extension Haskell Syntax Highlighting."
















-- About Haskell and functional programming.

haskell =
  "Haskell is a strongly typed, lazily evaluated " ++
  "functional programming language."
  
stronglytyped =
  "Strongly typed languages are very literal about " ++
  "the types of data, and will produce type errors " ++
  "of doing implicit type conversion."

lazyevaluation = "Lazily evaluated languages evaluate " ++
  "(roughly) only the parts of the program that are " ++
  "absolutely necessary to obtain the result. We will " ++
  "see more examples of this in the final lecture."

functionalprogramming =
  "Functional programming languages describe programs "++
  "as functional relations between input and output. " ++
  "These relations are independent of machine state, " ++
  "and are easier to, e.g., test, parallelise and reason "++
  "about."


















{-
  Functions in Haskell behave exactly as functions do in mathematics:
  they have a parameter (indeterminate), and applying a function on
  an input is done by substituting all occurences of the parameter by
  the input and reducing the resulting expression.
-}

-- The standard prelude.

-- Examples: numbers, [], (:), (++), head, tail, take, drop, !!,
-- [n..m], reverse, length, sum, product.

r = 22

s = 22.02

xs = [1,2,3,4,5,6]

ys = []

zs = 0:xs

vs = xs ++ [0,1,2,3] ++ xs

x1 = head xs
xs2 = tail xs

xs3 = take 3 xs
xs4 = drop 3 xs

y2 = xs !! 2

-- Don't do this!
-- y3 = xs !! (-2)

xs5 = [2..6]

xs6 = reverse xs5

s2 = length xs

nats = [0..]

n2 = take 10 nats

n3 = sum xs
n4 = product xs

-- We return 15:17.























--  Let's implement a few mathematical functions in Haskell.


-- Question: How do you expect the arithmetic operations to interact
-- in Haskell?


-- Exercise: f(x) = x.

saq x = x


-- Exercise: g(x) = x^2 + 2x + 3.

jakob x = x^2 + 2*x + 3
jakob' x = x**2 + 2*x + 3
jakob'' x = x*x + 2*x + 3

-- Exercise: h(x,y) = x^2 + y^2 + 1.

name (x,y) = x^2 + y^2 + 1
phillip x y = x^2 + y^2 + 1

-- Exercise: k(x) = g(x) / g(x-1).

low x = jakob x / jakob (x-1)

-- Return: 15:38



















----------------------------------------------------------------------
-- Central idea: Functions define equations.
----------------------------------------------------------------------

-- Show and tell: Without running it, argue what the value of g 3 is.

{-

jakob 3
 = 3^2 + 2*3 + 3
 = 9 + 6 + 3
 = 18

-}

-- Exercise: Show that the following two functions do the same thing
-- on all inputs.

double  x = x*2
double' x = x+x

-- We return 15:54.

{-

Goal: Show double x = double' x (for all x).

double y
 = y*2
 = y*(1+1)
 = y*1 + y*1
 = y+y
 = double' y

-}
































-- Example: Local declarations and the layout rule.

a = b + c
    where
      b = 2
      c = 3
d = a*2


{-
  Example: It is even quite easy to specify a function by cases using
  pattern matching.
-}


-- Exercise: Write two different functions that both compute the
-- factorial of a given number n.

