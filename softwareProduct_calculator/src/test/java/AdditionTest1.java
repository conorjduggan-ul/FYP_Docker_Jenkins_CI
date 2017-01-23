/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Testing of Addition functionality
*/

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class AdditionTest1 {

	// Create object of type Calculator
	Calculator calculator1 = new Calculator();

	@Test
	public void testAdditionCalculation1() {
		System.out.println("Running Test: AdditionTest1.testAdditionCalculation1");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("0", "0");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testAdditionCalculation2() {
		System.out.println("Running Test: AdditionTest1.testAdditionCalculation2");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("0", "1");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(1, answer, 0.0);
	}

	@Test
	public void testAdditionCalculation3() {
		System.out.println("Running Test: AdditionTest1.testAdditionCalculation3");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("1", "1");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(2, answer, 0.0);
	}

	@Test
	public void testAdditionCalculation4() {
		System.out.println("Running Test: AdditionTest1.testAdditionCalculation4");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("1", "2");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(3, answer, 0.0);
	}

	@Test
	public void testAdditionCalculation5() {
		System.out.println("Running Test: AdditionTest1.testAdditionCalculation5");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("2", "2");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(4, answer, 0.0);
	}
}