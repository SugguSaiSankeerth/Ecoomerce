package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbcon.DatabaseConnection;
import model.Item;
import model.Item_Seller;
import model.Seller;

public class DAO_Item_Seller {
	public static boolean add_Item_Seller(int seller_id,int item_id,int quantity,int address)
	{
		Connection conn=DatabaseConnection.getConnection();
		PreparedStatement preparedStatement = null;
		String query=null;
		query = "insert into item_seller(seller_id,item_id,quantity,address) VALUES " +
				 "(?,?,?,?);";
		try {
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, seller_id);
			preparedStatement.setInt(2, item_id);
			preparedStatement.setInt(3, quantity);
			preparedStatement.setInt(4, address);
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
		return false;
		
		
		
	}
	
	public static ArrayList<Item_Seller> get_all_item_seller(int seller_id){
		ArrayList<Item_Seller> is = new ArrayList<Item_Seller>();
		
		Item_Seller item_sell = new Item_Seller();

		ResultSet rs;
		try {
			Connection conn = DatabaseConnection.getConnection();
			java.sql.PreparedStatement preparedStatement = null;			
			String query = "select * from item_seller where seller_id=?";
			preparedStatement = conn.prepareStatement(query);
			preparedStatement.setInt(1, seller_id);
			rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				
				item_sell.setQuantity(rs.getInt("quantity"));
				item_sell.setAddress(rs.getInt("address"));
				item_sell.setItem_id(rs.getInt("item_id"));
				
				int item_id = rs.getInt("item_id");
				Item item = new Item();
				
				item = DAO_Item.Get_Item(item_id);
				
				item_sell.setItem(item);
				
				is.add(item_sell);
			}
			return is;

		} catch (SQLException e) {
			e.printStackTrace();
		}
		//return item.toString();
		//return sell;
		
		
		return null;
	}

}
