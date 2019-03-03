module App.Frontend(
    frontend
  ) where

import Control.Monad.Fix
import Control.Monad.IO.Class
import GHCJS.DOM.Types hiding (Text)
import Reflex.Dom

frontend :: (MonadHold t m, PostBuild t m, DomBuilder t m, MonadFix m, DomBuilderSpace m ~ GhcjsDomSpace, MonadIO m) => m ()
frontend = do
  (elmnt, _) <- el' "div" $ pure ()
  pure ()
