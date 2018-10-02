{-
 - Given a list of initial and final values with uncertainty,
 - subtracts the final values from the initial ones.
 -}

-- ----------BEGIN TYPES----------

type Value = Float
type Uncertainty = Float

-- -----------END TYPES-----------

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

-- ----------BEGIN SUBTRACTION----------

-- subtract the values, and add the uncertainties
subtractUn :: [Float] -> (Value, Uncertainty)
subtractUn [iniVal, iniUn, finVal, finUn] = ((iniVal - finVal), (iniUn + finUn))

-- -----------END SUBTRACTION-----------

-- ----------BEGIN OUTPUT----------

-- outputs all information
output :: [(Value, Uncertainty)] -> String
output ((v,u):cs) = show v ++ " " ++ show u ++ "\n" ++ output cs
output [] = ""

-- prepares processed data for output
dataOut :: [(Value, Uncertainty)] -> String
dataOut ((v,u):cs) = show v ++ " " ++ show u ++ "\n" ++ dataOut cs
dataOut [] = ""

-- -----------END OUTPUT-----------

main :: IO()
main = interact $ output . (map subtractUn) . getIn
