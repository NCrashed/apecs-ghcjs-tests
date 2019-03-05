module App.Frontend(
    frontend
  ) where

import Control.Monad
import Control.Monad.IO.Class

import qualified Data.Vector.Unboxed         as U
import qualified Data.Vector.Unboxed.Mutable as UM

frontend :: MonadIO m => m ()
frontend = liftIO $ do
  tags <- UM.replicate 10 (-2 :: Int)
  print . U.toList =<< U.unsafeFreeze tags
