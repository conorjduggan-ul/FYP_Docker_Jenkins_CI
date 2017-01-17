/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage: Testing of Division functionality
*/

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class DivisionTest2 {

	Calculator calculator1 = new Calculator();

	@Test
	public void testDivisionCalculation1() {
		System.out.println("Running Test: DivisionTest2.testDivisionCalculation1");
		calculator1.setOperands("2", "2");
		double answer = calculator1.divide();
		assertEquals(1, answer, 0.0);
	}

	@Test
	public void testDivisionCalculation2() {
		System.out.println("Running Test: DivisionTest2.testDivisionCalculation2");
		calculator1.setOperands("6", "3");
		double answer = calculator1.divide();
		assertEquals(2, answer, 0.0);
	}

	@Test
	public void testDivisionCalculation3() {
		System.out.println("Running Test: DivisionTest2.testDivisionCalculation3");
		calculator1.setOperands("3", "3");
		double answer = calculator1.divide();
		assertEquals(1, answer, 0.0);
	}

	@Test
	public void testDivisionCalculation4() {
		System.out.println("Running Test: DivisionTest2.testDivisionCalculation4");
		calculator1.setOperands("16", "4");
		double answer = calculator1.divide();
		assertEquals(4, answer, 0.0);
	}
}