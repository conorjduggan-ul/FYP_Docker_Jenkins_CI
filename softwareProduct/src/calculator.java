/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: In the terminal, type an operator name e.g. add, subtract, multiply, divide followed by two operands.
*/

public class calculator {

	public static void main(String [] args) {

		String errorMessage = "\nIn the terminal, type an operator name e.g. add," +
				" subtract, multiply, divide followed by two operands.\n\n" +
				"Sample execution: 'java calculator add 2 3'\n";

		if (args.length == 3) {

			if (args[0].equals("add") || 
				args[0].equals("subtract") || 
				args[0].equals("multiply") || 
				args[0].equals("divide")) {

				if (args[1].matches("^-?\\d+$") &&
					args[2].matches("^-?\\d+$")) {
					
					String operator = args[0];
					int operandOne = Integer.parseInt(args[1]);
				    int operandTwo = Integer.parseInt(args[2]);

				    switch(operator) {
				    	case "add": add(operandOne, operandTwo); break;
				    	case "subtract": subtract(operandOne, operandTwo); break;
				    	case "multiply": multiply(operandOne, operandTwo); break;
				    	case "divide": divide(operandOne, operandTwo); break;
				    }
				}
				else
					System.out.println("Invalid operand provided." + errorMessage);
			}
			else
				System.out.println("Invalid operator arg." + errorMessage);
		}
		else
			System.out.println("Invalid number of args." + errorMessage);
	}

	public static void add(int operandOne, int operandTwo) {
	    System.out.println(operandOne + operandTwo);
	}

	public static void subtract(int operandOne, int operandTwo) {
		System.out.println(operandOne - operandTwo);
	}

	public static void multiply(int operandOne, int operandTwo) {
	    System.out.println(operandOne * operandTwo);
	}

	public static void divide(int operandOne, int operandTwo) {
	    System.out.println(operandOne / operandTwo);
	}
}
