console.log("Operators in JavaScript");
// Arithmetic Operators
let a = 200;
let b = 100;
console.log("a + b =", a + b); // Addition
console.log("a - b =", a - b); // Subtraction
console.log("a * b =", a * b); // Multiplication
console.log("a / b =", a / b); // Division
console.log("a % b =", a % b); // Modulus
console.log("a ** 2 =", a ** 2); // Exponentiation
console.log("a++ =", a++); // Post-increment first print then increment
console.log("++a =", ++a); // Pre-increment first increment then print
console.log("b-- =", b--); // Post-decrement first print then decrement
console.log("--b =", --b); // Pre-decrement first decrement then print

// Assignment Operators
let x = 10;
x += 5; // x = x + 5 same as x = 10 + 5
console.log("x += 5 =", x);

x -= 5; // x = x - 5 same as x = 15 - 5
console.log("x -= 5 =", x);

x *= 2; // x = x * 2 same as x = 10 * 2
console.log("x *= 2 =", x);

x /= 4; // x = x / 4 same as x = 20 / 4
console.log("x /= 4 =", x);

x %= 3; // x = x % 3 same as x = 5 % 3
console.log("x %= 3 =", x);

x **= 2; // x = x ** 2 same as x = 2 ** 2
console.log("x **= 2 =", x);

// Comparison Operators
let y = 10;
let z = 20;
console.log("y == z =", y == z); // Equality
console.log("y === z =", y === z); // Strict equality strict equality checks both value and type
console.log("y != z =", y != z); // Inequality
console.log("y !== z =", y !== z); // Strict inequality number and string are not equal
console.log("y < z =", y < z); // Less than
console.log("y > z =", y > z); // Greater than
console.log("y <= z =", y <= z); // Less than or equal to 
console.log("y >= z =", y >= z); // Greater than or equal to
console.log("y ? z =", y ? z : "y is falsy"); // Ternary operator

// Logical Operators
let p = 10;
let q = 7;
console.log("p > q  && p==10 =", p > q && p == 10); // Logical AND both condition should be true
console.log("p > q  || p==10 =", p > q || p == 10); // Logical OR one of the condition is true
console.log("p > q =", p > q); // Logical NOT negates the condition
console.log("!(p > q) =", !(p > q)); // Logical NOT negates the condition

// Bitwise Operators
let m = 5; // In binary: 0101 
let n = 3; // In binary: 0011
console.log("m & n =", m & n); // Bitwise AND: 0001
console.log("m | n =", m | n); // Bitwise OR: 0111
console.log("m ^ n =", m ^ n); // Bitwise XOR: 0110
console.log("~m =", ~m); // Bitwise NOT: 1010
console.log("m << 1 =", m << 1); // Bitwise left shift
console.log("m >> 1 =", m >> 1); // Bitwise right shift
console.log("m >>> 1 =", m >>> 1); // Bitwise unsigned right shift

// Type Operators
let ass = "Hello";
console.log("typeof m =", typeof m); // Type of operator
console.log("typeof ass =", typeof ass); // Type of operator
console.log("m instanceof Number =", m instanceof Number); // Instanceof operator
console.log("ass instanceof String =", ass instanceof String); // Instanceof operator

// String Operators
let str1 = "Hello";
let str2 = "World";
console.log("str1 + str2 =", str1 + str2); // Concatenation
console.log("str1.concat(str2) =", str1.concat(str2)); // Concatenate strings
console.log("str1.length =", str1.length); // Length of string
console.log("str1.toUpperCase() =", str1.toUpperCase()); // Convert to uppercase
console.log("str1.toLowerCase() =", str1.toLowerCase()); // Convert to lowercase
console.log("str1.includes('lo') =", str1.includes('lo')); // Check if substring exists
console.log("str1.startsWith('He') =", str1.startsWith('He')); // Check if string starts with substring
console.log("str1.endsWith('lo') =", str1.endsWith('lo')); // Check if string ends with substring
console.log("str1.slice(0, 4) =", str1.slice(0, 4)); // Extract substring
console.log("str1.replace('l', 'x') =", str1.replace('l', 'x')); // Replace substring
console.log("str1.charAt(0) =", str1.charAt(0)); // Get character at index
console.log("str1.charCodeAt(0) =", str1.charCodeAt(0)); // Get character code at index ascii value
console.log("str1.split('') =", str1.split('')); // Split string into array of characters
console.log("str1.trim() =", str1.trim()); // Remove leading and trailing whitespace
console.log("str1.repeat(3) =", str1.repeat(3)); // Repeat string

// Array Operators
let arr = [1, 2, 3, 4, 5];
console.log("arr.length =", arr.length); // Length of array
console.log("arr[0] =", arr[0]); // Access element at index
console.log("arr.push(6) =", arr.push(6)); // Add element to end
console.log("arr.pop() =", arr.pop()); // Remove element from end
console.log("arr.shift() =", arr.shift()); // Remove element from beginning
console.log("arr.unshift(0) =", arr.unshift(0)); // Add element to beginning
console.log("arr.slice(1, 4) =", arr.slice(1, 4)); // Extract elements
console.log("arr.splice(1, 2) =", arr.splice(1, 2)); // Remove elements
console.log("arr.indexOf(3) =", arr.indexOf(3)); // Find index of element
console.log("arr.includes(3) =", arr.includes(3)); // Check if element exists
console.log("arr.join(', ') =", arr.join(', ')); // Join elements into string
