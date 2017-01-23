/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Testing of Addition functionality
*/

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class AdditionTest2 {

	// Create object of type Calculator
	Calculator calculator1 = new Calculator();

	@Test
	public void testAdditionCalculation1() {
		System.out.println("Running Test: AdditionTest2.testAdditionCalculation1");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("2", "3");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(5, answer, 0.0);
	}

	@Test
	public void testAdditionCalculation2() {
		System.out.println("Running Test: AdditionTest2.testAdditionCalculation2");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("3", "3");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(6, answer, 0.0);
	}

	@Test
	public void testAdditionCalculation3() {
		System.out.println("Running Test: AdditionTest2.testAdditionCalculation3");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("3", "4");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(7, answer, 0.0);
	}

	@Test
	public void testAdditionCalculation4() {
		System.out.println("Running Test: AdditionTest2.testAdditionCalculation4");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("4", "4");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(8, answer, 0.0);
	}

	@Test
	public void testAdditionCalculation5() {
		System.out.println("Running Test: AdditionTest2.testAdditionCalculation5");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("4", "5");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(9, answer, 0.0);
	}

	@Test
	public void testAdditionCalculation6() {
		System.out.println("Running Test: AdditionTest2.testAdditionCalculation6");
		
		// Set the two operand values in the Calculator object
		calculator1.setOperands("5", "5");
		// Call math function method on Calculator object using operands set above
		double answer = calculator1.add();
		assertEquals(10, answer, 0.0);
	}
}