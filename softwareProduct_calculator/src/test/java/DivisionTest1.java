/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Testing of Division functionality
*/

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class DivisionTest1 {

	// Create object of type Calculator
	Calculator calculator1 = new Calculator();

	@Test
	public void testDivisionCalculation2() {
		System.out.println("Running Test: DivisionTest1.testDivisionCalculation1");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("0", "1");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.divide();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testDivisionCalculation3() {
		System.out.println("Running Test: DivisionTest1.testDivisionCalculation2");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("1", "1");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.divide();
		assertEquals(1, answer, 0.0);
	}

	@Test
	public void testDivisionCalculation4() {
		System.out.println("Running Test: DivisionTest1.testDivisionCalculation3");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("1", "2");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.divide();
		assertEquals(0.5, answer, 0.0);
	}
}