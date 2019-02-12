package rest_services;

import java.sql.Connection;
import dao.DAO_Buyer;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.InputStream;

import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;
import dbcon.DatabaseConnection;
import model.Buyer;

import org.json.JSONObject;

@Path("buyerService")

public class Buyer_Service {
	@Path("buyerInfo")
    @POST
    @Consumes(MediaType.MULTIPART_FORM_DATA)
    @Produces(MediaType.TEXT_PLAIN)
	 public String getBuyerInfo(
	    		@FormDataParam("buyer_id") String buyer_id) throws Exception{
        
        Connection conn = DatabaseConnection.getConnection();
        Buyer buyer=DAO_Buyer.get_buyer_details(Integer.parseInt(buyer_id));
        JSONObject buy = new JSONObject();
        buy.put("name", buyer.getName());
        buy.put("email", buyer.getEmail());
        buy.put("mobile", buyer.getMobile());
        buy.put("dob", buyer.getDob());
        buy.put("address_1", buyer.getAddress_1());
        buy.put("address_2", buyer.getAddress_2());
        return buy.toString();
        
        
//        return "abc";
        
     }
	
	
	
	
	
	

}
