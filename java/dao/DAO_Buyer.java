package dao;
import model.Buyer;

import java.sql.*;

import dbcon.DatabaseConnection;

public class DAO_Buyer {
	public static boolean add_Buyer(String name,String dob,String mobile,String email,String address_1,String address_2)
	{
		Connection conn=DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = null;
		String query=null;
		query = "insert into buyer_table(name,dob,mobile,email,address_1,address_2) VALUES " +
				 "(?,?,?,?,?,?);";
		try {
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, dob);
			preparedStatement.setString(3, mobile);
			preparedStatement.setString(4, email);
			preparedStatement.setString(5, address_1);
			preparedStatement.setString(6, address_2);
			int rs = preparedStatement.executeUpdate();
			if(rs==0) {
				return false;
			}
			else {
				return true;
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return true;
	}
	
	public static Buyer get_buyer_details(int buyer_id) {
		Buyer buy = new Buyer();
		//Connection conn = null;
		ResultSet rs;
		try {
			Connection conn = DatabaseConnection.getConnection();
			java.sql.PreparedStatement preparedStatement = null;			
			String query = "select * from buyer_table where id=?";
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, buyer_id);
			rs = preparedStatement.executeQuery();
			if(rs.next()) {
				buy.setName(rs.getString("name"));
				buy.setDob(rs.getString("dob"));
				buy.setMobile(rs.getString("mobile"));
				buy.setAddress_1(rs.getString("address_1"));
				buy.setAddress_2(rs.getString("address_2"));
				buy.setEmail(rs.getString("email"));
				return buy;
			}
			else {
				//item.put("result", "fail");
				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		//return item.toString();
		return null;
	}

}
