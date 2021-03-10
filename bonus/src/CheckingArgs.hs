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
  
loadArgs :: [String] -> Conf -> Maybe Conf
loadArgs [] flags = Just flags
loadArgs (_:[]) _ = Nothing
loadArgs ("--rule":xs:xt) (Conf _ s l w m) = loadArgs xt
  (Conf (readMaybe xs) s l w m)
loadArgs ("--start":xs:xt) (Conf r _ l w m) = loadArgs xt
  (Conf r (readMaybe xs) l w m)
loadArgs ("--lines":xs:xt) (Conf r s _ w m) = loadArgs xt
  (Conf r s (readMaybe xs) w m)
loadArgs ("--window":xs:xt) (Conf r s l _ m) = loadArgs xt
  (Conf r s l (readMaybe xs) m)
loadArgs ("--move":xs:xt) (Conf r s l w _) = loadArgs xt
  (Conf r s l w (readMaybe xs))
loadArgs _ _ = Nothing

checkArgsValue :: Maybe Conf -> Maybe Conf
checkArgsValue Nothing = Nothing
checkArgsValue (Just(Conf r s l w m))
  | r > Just 255 = Nothing
  | r < Just 0 = Nothing
  | s < Just 0 = Nothing
  | w < Just 0 = Nothing
  | otherwise = (Just(Conf r s l w m))

checkArgs :: Maybe Conf -> Maybe Conf
checkArgs Nothing = Nothing
checkArgs (Just(Conf Nothing _ _ _ _)) = Nothing
checkArgs (Just(Conf _ Nothing _ _ _)) = Nothing
checkArgs (Just(Conf _ _ Nothing _ _)) = Nothing
checkArgs (Just(Conf _ _ _ Nothing _)) = Nothing
checkArgs (Just(Conf _ _ _ _ Nothing)) = Nothing
checkArgs (Just(Conf r s l w m)) = checkArgsValue (Just(Conf r s l w m))
