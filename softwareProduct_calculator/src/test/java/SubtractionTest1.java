/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Testing of Subtraction functionality
*/

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class SubtractionTest1 {

	// Create object of type Calculator
	Calculator calculator1 = new Calculator();

	@Test
	public void testSubtractionCalculation1() {
		System.out.println("Running Test: SubtractionTest1.testSubtractionCalculation1");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("0", "0");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.subtract();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testSubtractionCalculation2() {
		System.out.println("Running Test: SubtractionTest1.testSubtractionCalculation2");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("0", "1");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.subtract();
		assertEquals(-1, answer, 0.0);
	}

	@Test
	public void testSubtractionCalculation3() {
		System.out.println("Running Test: SubtractionTest1.testSubtractionCalculation3");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("1", "1");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.subtract();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testSubtractionCalculation4() {
		System.out.println("Running Test: SubtractionTest1.testSubtractionCalculation4");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("1", "2");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.subtract();
		assertEquals(-1, answer, 0.0);
	}
}