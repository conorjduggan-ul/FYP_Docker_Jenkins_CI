/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Create Object of type Calculator passing in two operands. Call an operator method on that object.
*/

public class Calculator {

	private static double operandOne;
	private static double operandTwo;

	Calculator() {

	}

	public void setOperands(String operandOne, String operandTwo) {

		if (true == checkIsDouble(operandOne, operandTwo)) {

			this.operandOne = Double.parseDouble(operandOne);
			this.operandTwo = Double.parseDouble(operandTwo);
		}
		else {
			System.out.println("ERROR: Input values are invalid. Must be int or double.");
		}
	}

	public static double add() {
	    //return "Calculation of " + operandOne + " + " + operandTwo + " = " + (operandOne + operandTwo);
	    return (operandOne + operandTwo);
	}

	public static double subtract() {
		//return "Calculation of " + operandOne + " - " + operandTwo + " = " + (operandOne - operandTwo);
	    return (operandOne - operandTwo);
	}

	public static double multiply() {
	    //return "Calculation of " + operandOne + " * " + operandTwo + " = " + (operandOne * operandTwo);
	    return (operandOne * operandTwo);
	}

	public static double divide() {
		//return "Calculation of " + operandOne + " / " + operandTwo + " = " + (operandOne / operandTwo);
	    return (operandOne / operandTwo);
	}

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
