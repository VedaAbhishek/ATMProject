package servlets;

public class Customer {
	
	private int accnum;
	private int pass;
	private String name;
	private int amount;
	public Customer(int accnum, int pass, String name, int amount) {
		super();
		this.accnum = accnum;
		this.pass = pass;
		this.name = name;
		this.amount = amount;
	}
	public Customer() {
		
	}
	public int getAccnum() {
		return accnum;
	}
	public void setAccnum(int accnum) {
		this.accnum = accnum;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	@Override
	public String toString() {
		return "Customer [accnum=" + accnum + ", pass=" + pass + ", name=" + name + ", amount=" + amount + "]";
	}
	
	
	
	

}
