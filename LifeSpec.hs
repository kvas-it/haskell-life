import Test.Hspec
import Life

p00 = Point 0 0
p01 = Point 0 1
p10 = Point 1 0
p11 = Point 1 1
p12 = Point 1 2
p21 = Point 2 1

emptyWorld = []
dyingWorld = [p00, p11]
staticWorld = [p00, p01, p10, p11]
fullWorld = p11 : surrounding p11
blinkerX = [p01, p11, p21]
blinkerY = [p10, p11, p12]

dist (Point x y) (Point x' y') = max (abs (x-x')) (abs (y-y')) 

main = hspec $ do

    describe "surrounding" $ do
        it "should be 8 points" $ do
            length (surrounding p12) `shouldBe` 8
        it "that are 1 pt away from origin" $ do
            (all (\pt -> (dist pt p12) == 1) $ surrounding p12) `shouldBe` True

    describe "neighbours" $ do
        it "should be picked" $ do
            (neighbours dyingWorld p00) `shouldBe` [p11]
            (neighbours staticWorld p00) `shouldBe` [p01, p10, p11] 
            (neighbours blinkerX p00) `shouldBe` [p01, p11]
        it "should be counted" $ do
            (neighbourCount dyingWorld p00) `shouldBe` 1
            (neighbourCount staticWorld p00) `shouldBe` 3

    describe "willBeAlive" $ do
        it "should kill lonely cells" $ do
            (willBeAlive dyingWorld p00) `shouldBe` False
        it "should keep ok cells" $ do
            (willBeAlive staticWorld p00) `shouldBe` True
        it "should create born cells" $ do
            (willBeAlive blinkerX p10) `shouldBe` True
        it "should kill overcrowded cells" $ do
            (willBeAlive fullWorld p11) `shouldBe` False

    describe "nextGeneration" $ do
        it "should kill dyingWorld" $ do
            (nextGeneration dyingWorld) `shouldBe` emptyWorld
        it "should keep staticWorld" $ do
            (nextGeneration staticWorld) `shouldBe` staticWorld
        it "should blink" $ do
            (nextGeneration blinkerX) `shouldBe` blinkerY
            (nextGeneration blinkerY) `shouldBe` blinkerX
