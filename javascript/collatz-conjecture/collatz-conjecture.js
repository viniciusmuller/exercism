//
// This is only a SKELETON file for the 'Collatz Conjecture' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const steps = (n, step = 0) => {
  if (n <= 0) throw new Error("Only positive numbers are allowed");
  if (n === 1) return step;
  return n % 2 == 0 ? steps(n / 2, step + 1) : steps(n * 3 + 1, step + 1);
};
