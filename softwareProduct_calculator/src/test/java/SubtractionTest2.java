/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Testing of Subtraction functionality
*/

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class SubtractionTest2 {

	Calculator calculator1 = new Calculator();

	@Test
	public void testSubtractionCalculation1() {
		System.out.println("Running Test: SubtractionTest2.testSubtractionCalculation1");
		calculator1.setOperands("2", "2");
		double answer = calculator1.subtract();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testSubtractionCalculation2() {
		System.out.println("Running Test: SubtractionTest2.testSubtractionCalculation2");
		calculator1.setOperands("2", "3");
		double answer = calculator1.subtract();
		assertEquals(-1, answer, 0.0);
	}

	@Test
	public void testSubtractionCalculation3() {
		System.out.println("Running Test: SubtractionTest2.testSubtractionCalculation3");
		calculator1.setOperands("3", "3");
		double answer = calculator1.subtract();
		assertEquals(0, answer, 0.0);
	}

	@Test
	public void testSubtractionCalculation4() {
		System.out.println("Running Test: SubtractionTest2.testSubtractionCalculation4");
		calculator1.setOperands("3", "4");
		double answer = calculator1.subtract();
		assertEquals(-1, answer, 0.0);
	}
}