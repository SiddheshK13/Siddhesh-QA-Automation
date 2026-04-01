//Conditional Statements

// 1. Declare and initialize the variable (Simulating an input)
let ageInput = "18"; // This could be a string input from a user, for example, using prompt() in a browser environment

// 2. Convert cleanly using ONE method.
let age = parseInt(ageInput, 10); /* Using parseInt to convert the string input to an integer. The second argument (10) specifies that the number is in base 10.
  This method will ignore any non-numeric characters after the number, so it will work even if the input has extra spaces or characters. 
  If the input cannot be converted to a number, it will return NaN (Not a Number). */

// 3. Evaluate
if (age >= 18) { // This will be the output for ages 18 and above
    ("Eligible to vote & drive."); // This will be the output for ages 18 and above
} else if (age < 18 && age >= 16) { // This will be the output for ages 16 and 17
    console.log("Eligible to drive but cannot vote."); 
} else if (age < 16 && age >= 15) { // This will be the output for ages 15 and 16
    console.log("Cannot vote but can drive with a learner's permit."); 
} else {
    console.log("Cannot vote or drive."); // This will be the output for ages below 15
}

