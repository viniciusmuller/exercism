//
// This is only a SKELETON file for the 'Pangram' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isPangram = (text) => {
  const uniqueChars = new Set(text.toLowerCase().match(/[a-z]/g));
  return uniqueChars.size === 26;
};
