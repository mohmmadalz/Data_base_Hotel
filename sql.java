/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author 8boda
 */
import java.sql.*; 
public class sql {
    

 public static void main(String arg[]) { 
 Connection connection = null; 
 try { 
 Class.forName("com.mysql.cj.jdbc.Driver"); 
 connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Hotel" , 
 "root", ""); 

 } 
 catch (Exception exception) { 
 System.out.println(exception); 
 } 
 } // function ends 
} // class ends 
    

