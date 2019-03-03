module App.Frontend(
    frontend
  ) where

import Apecs
import Control.Monad
import Control.Monad.IO.Class

frontend :: MonadIO m => m ()
frontend = do
  issue01
  -- issue02

data ComponentA = ComponentA
  deriving (Show)

instance Component ComponentA where
  type Storage ComponentA = Map ComponentA

data ComponentB = ComponentB
  deriving (Show)

instance Component ComponentB where
  type Storage ComponentB = Cache 100 (Map ComponentB)

data ComponentC = ComponentC
  deriving (Show)

instance Component ComponentC where
  type Storage ComponentC = Cache 100 (Map ComponentC)

data World = World {
  worldAs :: !(Storage ComponentA)
, worldBs :: !(Storage ComponentB)
, worldCs :: !(Storage ComponentC)
, worldEs :: !(Storage EntityCounter)
}

instance Monad m => Has World m ComponentA where getStore = asks worldAs
instance Monad m => Has World m ComponentB where getStore = asks worldBs
instance Monad m => Has World m ComponentC where getStore = asks worldCs
instance Monad m => Has World m EntityCounter where getStore = asks worldEs

newWorld :: MonadIO m => m World
newWorld = do
  worldAs <- explInit
  worldBs <- explInit
  worldCs <- explInit
  worldEs <- explInit
  pure World{..}

issue01 :: MonadIO m => m ()
issue01 = do
  w <- newWorld
  runWith w $ do
    _ <- replicateM 10 $ void $ newEntity (ComponentA, ComponentB)
    cmapM_ $ \(a :: ComponentA, b :: ComponentB, e :: Entity) -> liftIO $ print e
