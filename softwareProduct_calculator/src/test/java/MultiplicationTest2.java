/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Testing of Multiplication functionality
*/

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class MultiplicationTest2 {

	// Create object of type Calculator
	Calculator calculator1 = new Calculator();

	@Test
	public void testMultiplicationCalculation1() {
		System.out.println("Running Test: MultiplicationTest2.testMultiplicationCalculation1");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("2", "2");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.multiply();
		assertEquals(4, answer, 0.0);
	}

	@Test
	public void testMultiplicationCalculation2() {
		System.out.println("Running Test: MultiplicationTest2.testMultiplicationCalculation2");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("2", "3");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.multiply();
		assertEquals(6, answer, 0.0);
	}

	@Test
	public void testMultiplicationCalculation3() {
		System.out.println("Running Test: MultiplicationTest2.testMultiplicationCalculation3");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("3", "3");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.multiply();
		assertEquals(9, answer, 0.0);
	}

	@Test
	public void testMultiplicationCalculation4() {
		System.out.println("Running Test: MultiplicationTest2.testMultiplicationCalculation4");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("3", "4");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.multiply();
		assertEquals(12, answer, 0.0);
	}
}