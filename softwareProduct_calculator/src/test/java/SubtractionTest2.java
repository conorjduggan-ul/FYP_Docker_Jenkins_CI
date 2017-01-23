/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Testing of Subtraction functionality
*/

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class SubtractionTest2 {

	// Create object of type Calculator
	Calculator calculator1 = new Calculator();

	@Test
	public void testSubtractionCalculation1() {
		
		System.out.println("Running Test: SubtractionTest2.testSubtractionCalculation1");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("2", "2");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.subtract();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testSubtractionCalculation2() {
		System.out.println("Running Test: SubtractionTest2.testSubtractionCalculation2");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("2", "3");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.subtract();
		assertEquals(-1, answer, 0.0);
	}

	@Test
	public void testSubtractionCalculation3() {
		System.out.println("Running Test: SubtractionTest2.testSubtractionCalculation3");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("3", "3");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.subtract();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testSubtractionCalculation4() {
		System.out.println("Running Test: SubtractionTest2.testSubtractionCalculation4");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("3", "4");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.subtract();
		assertEquals(-1, answer, 0.0);
	}
}