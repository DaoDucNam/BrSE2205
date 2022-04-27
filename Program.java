package TesttingSystem_Assignment_1;

import java.sql.Date;
import java.time.LocalDateTime;

public class Program {
	private static final Department Sales = null;

	public static void main(String[] args) {
		// Create Department
		Department d1 = new Department();
		d1.id = 1;
		d1.name = "SALE";

		Department d2 = new Department();
		d2.id = 2;
		d1.name = "HR";
		
		Department d3 = new Department();
		d3.id = 3;
		d3.name = "DEV";
		
		// Create Group
		Group gr1 = new Group();
		gr1.id = 1;
		gr1.name ="Java";
		
		Group gr2 = new Group();
		gr2.id = 2;
		gr2.name ="Python";
		
		Group gr3 = new Group();
		gr3.id = 3;
		gr3.name ="SQL";
		
		// Create Acount
		
		Account ac1 = new Account();
		ac1.id = 1;
		ac1.email = "nguyenvanA@gmail.com";
		ac1.department = d1;
		
		Account ac2 = new Account();
		ac2.id = 2;
		ac2.email = "tranvanB@gmail.com";
		ac2.department = d2;
		
		Account ac3 = new Account();
		ac3.id = 3;
		ac3.email = "LevanC@gmail.com";
		ac3.department = d3;
		
		Group[] groupOfAccount1 = {gr1, gr2};
		ac1.groups = groupOfAccount1;
		
		Group[] groupOfAccount2 = {gr1, gr3};
		ac2.groups = groupOfAccount2;
		
		Group[] groupOfAccount3 = {gr2, gr3};
		ac3.groups = groupOfAccount3;
		
		ac1.createDate = new Date(2022-04-26);
		ac2.createDate = new Date(2022-04-26);
		ac3.createDate = new Date(2022-04-26);
			
		
		System.out.println("Thong tin phong ban 1: ");
		System.out.println("name " + d1.name);
		System.out.println("id: " + d1.id);
		System.out.println("\n ");
		
		System.out.println("Thong tin phong ban 2: ");
		System.out.println("name " + d2.name);
		System.out.println("id: " + d2.id);
		System.out.println("\n ");
		
		System.out.println("Thong tin Account 1: ");
		System.out.println("id:  " + ac1.id);
		System.out.println("Email: " + ac1.email);
		
		System.out.println("Thong tin Account 2: ");
		System.out.println("id:  " + ac2.id);
		System.out.println("Email: " + ac2.email);
		
		System.out.println("Department Name: " + ac1.department.name);
		System.out.println("Create Date: " + ac1.createDate);
		
		System.out.println("Department Name: " + ac2.department.name);
		System.out.println("Create Date: " + ac2.createDate);
		
	}

}
