/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Testing of Multiplication functionality
*/

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class MultiplicationTest1 {

	// Create object of type Calculator
	Calculator calculator1 = new Calculator();

	@Test
	public void testMultiplicationCalculation1() {
		System.out.println("Running Test: MultiplicationTest1.testMultiplicationCalculation1");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("0", "0");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.multiply();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testMultiplicationCalculation2() {
		System.out.println("Running Test: MultiplicationTest1.testMultiplicationCalculation2");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("0", "1");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.multiply();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testMultiplicationCalculation3() {
		System.out.println("Running Test: MultiplicationTest1.testMultiplicationCalculation3");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("1", "1");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.multiply();
		assertEquals(1, answer, 0.0);
	}

	@Test
	public void testMultiplicationCalculation4() {
		System.out.println("Running Test: MultiplicationTest1.testMultiplicationCalculation4");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("1", "2");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.multiply();
		assertEquals(2, answer, 0.0);
	}
}