/*
	Author: Conor Duggan
	Email: 13127004@studentmail.ul.ie

	Project Title: FYP Software Product - Calculator

	Usage:
*/

public class runCalculator {

	public static void main(String [] args) {

		Calculator calculator1 = new Calculator("2", "3");
		System.out.println(calculator1.add());
		System.out.println(calculator1.subtract());
		System.out.println(calculator1.multiply());
		System.out.println(calculator1.divide());
	}
}