{-# OPTIONS_GHC -fno-warn-type-defaults #-}

import Data.Foldable     (for_)
import Test.Hspec        (Spec, describe, it, shouldBe)
import Test.Hspec.Runner (configFastFail, defaultConfig, hspecWith)

import Triangle
  ( TriangleType ( Equilatero
                 , Ilegal
                 , Isosceles
                 , Escaleno
                 )
  , triangleType
  )

main :: IO ()
main = hspecWith defaultConfig {configFastFail = True} specs

specs :: Spec
specs = describe "triangleType" $ for_ cases test
  where

    test (description, (a, b, c), expected) = it description assertion
      where
        assertion = triangleType a b c `shouldBe` expected

    cases = [ ( "triangulo Equilatero tem todos os lados iguais"
              , (2, 2, 2)
              , Equilatero
              )
            , ( "Triângulo equilátero maior"
              , (10, 10, 10)
              , Equilatero
              )
            , ( "Triângulo isósceles com os dois últimos lados iguais"
              , (3, 4, 4)
              , Isosceles
              )
            , ( "Triângulo isósceles com dois lados iguais"
              , (4, 4, 3)
              , Isosceles
              )
            , ( "Triângulo isósceles com o primeiro e o último lado igual"
              , (4, 3, 4)
              , Isosceles
              )
            , ( "Triângulo isósceles com lados desiguais maiores do que lados iguais"
              , (4, 7, 4)
              , Isosceles
              )
            , ( "Triângulo escaleno não tem lados iguais"
              , (3, 4, 5)
              , Escaleno
              )
            , ( "2a == b+c Parece equilátero, mas nem sempre"
              , (5, 4, 6)
              , Escaleno
              )
            , ( "Triângulo escaleno maior"
              , (10, 11, 12)
              , Escaleno
              )
            , ( "Triângulo escaleno com lados em ordem decrescente"
              , (5, 4, 2)
              , Escaleno
              )
            , ( "Triângulo de escaleno pequeno com valores de ponto flutuante"
              , (0.4, 0.6, 0.3)
              , Escaleno
              )
            , ( "Um triângulo que viola a desigualdade do triângulo é ilegal"
              , (7, 3, 2)
              , Ilegal
              )
            , ( "Dois lados são iguais, mas ainda violam a desigualdade triangular"
              , (1, 1, 3)
              , Ilegal
              )
            , ( "Os triângulos com todos os lados são ilegais"
              , (0, 0, 0)
              , Ilegal
              )
            ]
