//
// This is only a SKELETON file for the 'Matching Brackets' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const isPaired = (string) => {
  let opened = [];

  for (const char of string) {
    const target = opened[0];
    switch (char) {
      case "[":
      case "{":
      case "(":
        opened.unshift(char);
        break;
      case "]":
        if (target == "[") {
          opened.shift();
          break;
        }
        return false;
      case "}":
        if (target == "{") {
          opened.shift();
          break;
        }
        return false;
      case ")":
        if (target == "(") {
          opened.shift();
          break;
        }
        return false;
    }
  }
  return opened.length == 0;
};
