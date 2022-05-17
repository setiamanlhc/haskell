module GroupStudents where

-- We want to implement a function that groups a list of student record pairs:
students = [
    ("Vidy", 'C')
  , ("Sergiu", 'B')
  , ("Matthew", 'A')
  , ("Fiaz", 'C')
  , ("Jess", 'B')
  , ("Martin", 'B')
  , ("Marcia", 'B')
  , ("Pawel", 'C')
  , ("Hinson", 'B')
  , ("Telmo", 'B')
  , ("Thinh", 'B')
  , ("Jiaranai", 'B')
  , ("John", 'B')
  , ("Setiaman", 'C')
  , ("Victor", 'A')
  , ("Andrew", 'C')
  , ("Bert-Jan", 'C')
  , ("Ian", 'T')
  ]
-- Our output will be a three-tuple containing 3 lists: (Group A, Group B, Group C).
-- In an imperative language we would use mutable variables and a loop to solve this
-- (see group_students.py file for a Python example), but how can we translate this into Haskell?

-- We would like our type signature to look like this:
groupStudents_ :: [StudentRecord] -> GroupedStudents
groupStudents_ = undefined
-- However, if we try to implement this function using primitive recursion, we run into a problem!
-- Our function takes a list of tuples, but it returns a tuple of lists.
-- It's too complex for a simple recursive solution as we've used with other functions like `myMap`:
--   myMap :: (a -> b) -> [a] -> [b]
--   myMap f (x:xs) = f x : (myMap f xs)
--                          ^ note how the right parameter expected by cons (:) has the same type
--                            as `myMap`'s return val ([b]);
--                            this allows us to easily recurse and join the results
-- But if we attempt to call `groupStudents_` inside itself this way, we'll get a type error...
-- there's no way to join the results of previous calls to new ones the way it's currently defined.


-- How do we solve this? We need to add a new parameter to our function.
-- This parameter is called an "accumulator", because it will accumulate results from the recursive
-- function calls, and return them once the input list is empty.

-- Introduce some type synonyms to make our type signature more readable:
type StudentRecord = (String, Char)
type GroupedStudents = ([String], [String], [String])

groupStudents_' :: GroupedStudents -> [StudentRecord] -> GroupedStudents
--                ^ the accumulator should come before the input list...
--                  ...and always has the same type as the return value (GroupedStudents)
groupStudents_' g [] = g
groupStudents_' g (sr:srs) = case group of
  'A' -> groupStudents_' (name : as, bs, cs) srs
  'B' -> groupStudents_' (as, name : bs, cs) srs
  'C' -> groupStudents_' (as, bs, name : cs) srs
  _   -> groupStudents_' g srs
  where
    (name, group) = sr
    (as, bs, cs) = g

-- This solves our problem, but our function has become more unwieldy to work with.
-- Whenever we call it, we now need to remember to provide an initial accumulator value,
-- which will always be the same tuple of empty lists: ([], [], []).
-- We could use partial application to solve this: `groupStudents_ = groupStudents_' ([], [], [])`
-- This is an easy fix since we ordered our parameters correctly, putting the accumulator first.

-- A more common and sophisticated approach is to use a programming pattern called "recursive-go".
-- We use a `where` block to define a helper function, idiomatically named `go`.
-- The helper function handles the recursion via an accumulator, like `groupStudents_'` above.
-- The main function is simply a wrapper that calls the helper with the initial accumulator value.
-- This allows the main function to maintain the simpler type signature we expect it to have.

groupStudents :: [StudentRecord] -> GroupedStudents
groupStudents srs = go ([], [], []) srs
  where
    -- note: Haskellers typically omit the type signatures for helper functions, but you can always
    -- include them whenever needed to reason through your code
    go :: GroupedStudents -> [StudentRecord] -> GroupedStudents
    go g [] = g
    go g (sr:srs) = let (name, group) = sr
                        (as, bs, cs) = g
                    in case group of
      'A' -> go (name : as, bs, cs) srs
      'B' -> go (as, name : bs, cs) srs
      'C' -> go (as, bs, name : cs) srs
      _   -> go g srs


-- *** Challenge: `groupStudents` using a fold ***
-- After learning about folds and completing the fold exercises, return to this problem:
-- Do you notice any similarities between the type signatures for `go` and `foldr`?
-- Can you replace the verbose "recursive-go" solution with `foldr`?
-- Define a reducer function that takes a `StudentRecord` value and a `GroupedStudents` value,
-- and returns a new `GroupedStudents` value.