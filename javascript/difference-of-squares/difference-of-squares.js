//
// This is only a SKELETON file for the 'Difference Of Squares' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Squares {
  constructor(n) {
    this.sumOfSquares = this.sum([...Array(n + 1).keys()].map((x) => x ** 2));
    this.squareOfSum = this.sum([...Array(n + 1).keys()]) ** 2;
    this.difference = Math.abs(this.sumOfSquares - this.squareOfSum);
  }

  sum(arr) {
    return arr.reduce((acc, i) => acc + i);
  }
}
