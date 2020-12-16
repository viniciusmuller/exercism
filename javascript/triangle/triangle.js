//
// This is only a SKELETON file for the 'Triangle' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export class Triangle {
  constructor(...sides) {
    this.sides = new Set(sides);
    this.valid = this.isValid(sides);
  }

  isEquilateral = () => {
    if (!this.valid) return false;
    return this.sides.size == 1;
  };

  isIsosceles = () => {
    if (!this.valid) return false;
    return this.sides.size <= 2;
  };

  isScalene = () => {
    if (!this.valid) return false;
    return this.sides.size == 3;
  };

  isValid = (sides) => {
    const [s1, s2, s3] = sides;

    if (sides.some((v) => v < 0)) return false;

    // https://en.wikipedia.org/wiki/Triangle_inequality#Mathematical_expression_of_the_constraint_on_the_sides_of_a_triangle
    if ([s1 + s2 > s3, s2 + s3 > s1, s3 + s1 > s2].some((x) => !x))
      return false;

    return true;
  };
}
