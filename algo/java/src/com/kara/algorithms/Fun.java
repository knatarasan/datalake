package com.kara.algorithms;

public class Fun {

	Fun() {
		System.out.print("Fun constructor\n");
	}

	void fun() {
		System.out.print("Fun mathod\n");
	}

	public static void main(String[] args) {
		Fun fu = new Fun();
		fu.fun();
		Fen fe = new Fen();
		fe.fen();

	}

}

class Fen {

	Fen() {
		System.out.print("fen construuctor\n");

	}

	void fen(){
		System.out.print("Fen method\n");
	}
}