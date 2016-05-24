{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TemplateHaskell   #-}

module Test.Tinfoil.Data.Signing where

import           Disorder.Core.Tripping (tripping)

import           P

import           System.IO

import           Tinfoil.Data.Signing

import           Test.Tinfoil.Arbitrary ()
import           Test.QuickCheck

prop_tripping_SignatureVersion :: SignatureVersion -> Property
prop_tripping_SignatureVersion = tripping renderSignatureVersion parseSignatureVersion

return []
tests :: IO Bool
tests = $forAllProperties $ quickCheckWithResult (stdArgs { maxSuccess = 100 } )
