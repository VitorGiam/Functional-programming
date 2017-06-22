module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilatero
                  | Isosceles
                  | Escaleno
                  | Ilegal
                  deriving (Eq, Show)

triangleType :: Num a => a -> a -> a -> TriangleType
triangleType a b c = error "Voce precisa implementar essa função."
