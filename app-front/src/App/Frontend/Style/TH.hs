-- | Module that contains embedded CSS files from statics to reduce compilation
-- time as TemplateHaskell is quite slow in GHCJS.
module App.Frontend.Style.TH(
    milligramCss
  ) where

import Data.FileEmbed
import Data.ByteString (ByteString)

milligramCss :: ByteString
milligramCss = $(embedFile "statics/css/milligram.min.css")
