/*
Magicsquare program Generates all possible 3 by 3 magic squares
author  Jay Lee
version 1.0
since   2020-05-11
*/

var presenceArray = [Int](repeating: 0, count: 9)

// This function uses recursion to generate the magic square.
func GenSquare(square: [Int], magicIndex: Int) {
  var square = square
  for index in 0..<9 {
    if (presenceArray[index] == 0) {
      square[magicIndex] = index + 1
      presenceArray[index] = 1
      if (magicIndex < square.count - 1) {
        GenSquare(square: square, magicIndex: magicIndex + 1);
      } else if (IsMagic(possibleSquare: square)) {
        PrintMagicSquare(outputSquare: square)
      }
      presenceArray[index] = 0;
    }
  }
}

// This function checks square is the magic square and return boolean.
func IsMagic(possibleSquare:[Int]) -> Bool {
  let MAGICNUM = 15

  let row1 = possibleSquare[0] + possibleSquare[1] + possibleSquare[2]
  let row2 = possibleSquare[3] + possibleSquare[4] + possibleSquare[5]
  let row3 = possibleSquare[6] + possibleSquare[7] + possibleSquare[8]
  let col1 = possibleSquare[0] + possibleSquare[3] + possibleSquare[6]
  let col2 = possibleSquare[1] + possibleSquare[4] + possibleSquare[7]
  let col3 = possibleSquare[2] + possibleSquare[5] + possibleSquare[8]
  let diag1 = possibleSquare[0] + possibleSquare[4] + possibleSquare[8]
  let diag2 = possibleSquare[2] + possibleSquare[4] + possibleSquare[6]

  return row1 == MAGICNUM && row2 == MAGICNUM && row3 == MAGICNUM
         && col1 == MAGICNUM && col2 == MAGICNUM && col3 == MAGICNUM
         && diag1 == MAGICNUM && diag2 == MAGICNUM
}

// This function prints inputted array in a magic square format.
func PrintMagicSquare(outputSquare: [Int]) {
  print("\n*****")
  for index in 0..<outputSquare.count {
    if (index % 3 == 0) {
      print("")
    }
    print(outputSquare[index], terminator:" ")
  }
  print("\n*****")
}

// main stub
print("All Possible Magic Squares (3x3):\n")
var magicSquare = Array(1...9)
GenSquare(square: magicSquare, magicIndex: 0)
print("\nDone.")
