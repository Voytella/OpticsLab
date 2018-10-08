-- take the sine of all a data table's numbers

-- ----------BEGIN INPUT----------

-- convert initial String into list of list of numbers
getIn :: String -> [[Float]]
getIn s = map line2NumList (lines s)

-- converts space-delimited String into list of Numbers
line2NumList :: String -> [Float]
line2NumList s = map readFloat (words s)

-- type-safe version of read for Floats
readFloat :: String -> Float
readFloat = read

-- -----------END INPUT-----------

-- ----------BEGIN APPLY SINE----------

-- apply the sine function to each value in the given list
sineLine :: [Float] -> [Float]
sineLine l = map sinDeg l

-- convert degrees to radians, then take the sine
sinDeg :: Float -> Float
sinDeg x = sin ((x * pi) / 180)

-- -----------END APPLY SINE-----------

-- ----------BEGIN OUTPUT----------

-- print output as CSV
output :: [[Float]] -> String
output [] = ""
output (l:ls) = showLine l ++ "\n" ++ output ls

-- convert just one line into a string
showLine :: [Float] -> String
showLine (x:[]) = show x
showLine (x:xs) = show x ++ "," ++ showLine xs

-- -----------END OUTPUT-----------

main :: IO()
main = interact $ output . (map sineLine) . getIn
