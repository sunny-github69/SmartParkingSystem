package com.model;

import java.sql.*;

public class db_connection {
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			Connection con = get_Connection.getdbConnection();
//			Statement s = con.createStatement();
//			s.executeUpdate("INSERT INTO vmps_parking (prop_name, user_id, car_slot, bike_slot, city, state, email) "
//					+ "VALUES ('GIP_NOIDA', 'GIPNOIDA_123', '50', '60', 'Noida', 'Uttar Pradesh', 'gip.noida@gmail.com')");
			con.close();
		} catch (SQLException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
