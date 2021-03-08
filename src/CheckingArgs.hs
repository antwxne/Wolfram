module CheckingArgs where

import Text.Read

data Conf = Conf {
  rule :: Maybe Int,
  start :: Maybe Int,
  line :: Maybe Int,
  window :: Maybe Int,
  move :: Maybe Int
} deriving(Show)

defaultArgs :: Conf
defaultArgs =  Conf {
  rule = Nothing,
  start = Just 0,
  line = Just (-1),
  window = Just 80,
  move = Just 0
}

knownRules :: [Maybe Int]
knownRules = [Just 30, Just 90, Just 110]
  
loadArgs :: [String] -> Conf -> Maybe Conf
loadArgs [] flags = Just flags
loadArgs (_:[]) _ = Nothing
loadArgs (x:xs:xt) (Conf r s l w m)
  | x == "--rule" = loadArgs xt (Conf (readMaybe xs) s l w m)
  | x == "--start" = loadArgs xt (Conf r (readMaybe xs) l w m)
  | x == "--line" = loadArgs xt (Conf r s (readMaybe xs) w m)
  | x == "--window" = loadArgs xt (Conf r s l (readMaybe xs) m)
  | x == "--move" = loadArgs xt (Conf r s l w (readMaybe xs))
  | otherwise = Nothing

checkArgs :: Maybe Conf -> Maybe Conf
checkArgs Nothing = Nothing
checkArgs (Just(Conf Nothing _ _ _ _)) = Nothing
checkArgs (Just(Conf _ Nothing _ _ _)) = Nothing
checkArgs (Just(Conf _ _ Nothing _ _)) = Nothing
checkArgs (Just(Conf _ _ _ Nothing _)) = Nothing
checkArgs (Just(Conf _ _ _ _ Nothing)) = Nothing
checkArgs (Just(Conf r s l w m))
  | r `notElem` knownRules = Nothing
  | s < Just 0 = Nothing
  | l < Just 0 = Nothing
  | w < Just 0 = Nothing
  | otherwise = (Just(Conf r s l w m))
