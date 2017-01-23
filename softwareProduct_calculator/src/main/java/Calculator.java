/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Create Object of type Calculator. 
			Set two operands through setOperands method. 
			Call a math function method on that Calculator object.
*/

public class Calculator {

	private static double operandOne;
	private static double operandTwo;

	Calculator() {

	}

	// Method to set the two operand values used for math functions
	public void setOperands(String operandOne, String operandTwo) {

		// Call method to check values passed in are doubles
		if (true == checkIsDouble(operandOne, operandTwo)) {

			this.operandOne = Double.parseDouble(operandOne);
			this.operandTwo = Double.parseDouble(operandTwo);
		}
		else {
			System.out.println("ERROR: Input values are invalid. Must be int or double.");
		}
	}

	// Addition math function of two operands
	public static double add() {
	    
	    return (operandOne + operandTwo);
	}

	// Subtraction math function of two operands
	public static double subtract() {
		
		return (operandOne - operandTwo);
	}

	// Multiplication math function of two operands
	public static double multiply() {
	    
	    return (operandOne * operandTwo);
	}

	// Division math function of two operands
	public static double divide() {
		
		return (operandOne / operandTwo);
	}

	// Method to check two passed in values qualify as type double
	private static boolean checkIsDouble(String operandOne, String operandTwo) {
		
		String patternInt = "([0-9]+)";
		String patternDouble = "([0-9]*)\\.([0-9]*)";
		boolean inputsAccepted = false;

		if ( (operandOne.matches(patternInt) || operandOne.matches(patternDouble)) && 
			(operandTwo.matches(patternInt) || operandTwo.matches(patternDouble)))
			inputsAccepted = true;

		return inputsAccepted;
	}
}
