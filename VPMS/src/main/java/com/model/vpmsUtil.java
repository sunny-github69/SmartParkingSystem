package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class vpmsUtil {
	static public Map<Integer, String> getParkingList(String city, String state) {
		Map<Integer, String> data = new HashMap<Integer, String>();
//	    data.put(keyWord, certainValue); 
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con
					.prepareStatement("SELECT prop_name FROM vmps_parking where city=? AND state=?");
			pstmt.setString(1, city);
			pstmt.setString(2, state);
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next()) {
				data.put(i, rs.getString("prop_name"));
				i++;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}

	static public Map<Integer, String> getCarSlot(String Propname) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("SELECT car_slot FROM vmps_parking where prop_name=?");
			pstmt.setString(1, Propname);
			ResultSet rs = pstmt.executeQuery();
			data.put(1, Propname);
			while (rs.next()) {
				data.put(2, rs.getString("car_slot"));
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}

	static public Map<Integer, String> getbikeSlot(String Propname) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("SELECT bike_slot FROM vmps_parking where prop_name=?");
			pstmt.setString(1, Propname);
			ResultSet rs = pstmt.executeQuery();
			data.put(1, Propname);
			while (rs.next()) {
				data.put(2, rs.getString("bike_slot"));
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}

	static public Map<Integer, String> bookCar(String name, String carNo, String propName, String mob, String id) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con
					.prepareStatement("SELECT car_no FROM book_car where car_no=? and propName = ?");
			pstmt.setString(1, carNo);
			pstmt.setString(2, propName);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data.put(1, "AlreadyBooked");
			} else {
				PreparedStatement inPstmt = con.prepareStatement(
						"INSERT INTO book_car (car_no, propname, name, mobile_nol, eleid) VALUES (?, ?, ?, ?, ?)");
				inPstmt.setString(1, carNo);
				inPstmt.setString(2, propName);
				inPstmt.setString(3, name);
				inPstmt.setString(4, mob);
				inPstmt.setString(5, id);
				inPstmt.executeUpdate();
				data.put(1, "Booked");
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}
	
	static public void carDel(String propName, String carNo) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("Delete FROM book_car where car_no=? and propName = ?");
			pstmt.setString(1, carNo);
			pstmt.setString(2, propName);
			pstmt.executeUpdate();
			
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
//		return data;
	}
	
	static public void bikeDel(String propName, String bikeNo) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("Delete FROM book_bike where bike_no=? and propName = ?");
			pstmt.setString(1, bikeNo);
			pstmt.setString(2, propName);
			pstmt.executeUpdate();
			
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
//		return data;
	}

	static public Map<Integer, String> bookbike(String name, String bikeNo, String propName, String mob, String id) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con
					.prepareStatement("SELECT bike_no FROM book_bike where bike_no=? AND propName = ?");
			pstmt.setString(1, bikeNo);
			pstmt.setString(2, propName);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data.put(1, "AlreadyBooked");
			} else {
				PreparedStatement inPstmt = con.prepareStatement(
						"INSERT INTO book_bike (bike_no, propname, name, mobile_nol, eleid) VALUES (?, ?, ?, ?, ?)");
				inPstmt.setString(1, bikeNo);
				inPstmt.setString(2, propName);
				inPstmt.setString(3, name);
				inPstmt.setString(4, mob);
				inPstmt.setString(5, id);
				inPstmt.executeUpdate();
				data.put(1, "Booked");
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}

	static public Map<Integer, String> prop_SignUp(String prop_Name, String userID, String carSlot, String bikeSlot,
			String city, String State, String emailAddress, String passWord) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("SELECT prop_name FROM vmps_parking where prop_name = ?;");
			pstmt.setString(1, prop_Name);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data.put(1, "AlreadyReg");
			} else {
				PreparedStatement inPstmt = con.prepareStatement(
						"INSERT INTO vmps_parking (prop_name, user_id, car_slot, bike_slot, city, state, email, pass) VALUES (?, ?, ?, ?, ?, ?, ?, ?);");
				inPstmt.setString(1, prop_Name);
				inPstmt.setString(2, userID);
				inPstmt.setString(3, carSlot);
				inPstmt.setString(4, bikeSlot);
				inPstmt.setString(5, city);
				inPstmt.setString(6, State);
				inPstmt.setString(7, emailAddress);
				inPstmt.setString(8, passWord);
				inPstmt.executeUpdate();
				data.put(1, "created");
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}

	static public Map<Integer, String> login(String emailAddress, String password) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con
					.prepareStatement("SELECT prop_name FROM vmps_parking where email = ? AND pass = ?;");
			pstmt.setString(1, emailAddress);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				data.put(1, "Logined");
				data.put(2, rs.getString("prop_name"));
			} else {
				data.put(1, "Logined failed");
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}

	static public Map<Integer, List<String>> cardata(String prop_name) {
		Map<Integer, List<String>> data = new HashMap<Integer, List<String>>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM book_car where propname = ?;");
			pstmt.setString(1, prop_name);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("list--->"+rs);
			int i = 1;
			while (rs.next()) {
				List<String> list = new ArrayList<>();
				list.add(rs.getString("name"));
				list.add(rs.getString("mobile_nol"));
				list.add(rs.getString("car_no"));
				list.add(rs.getString("propname"));
				list.add(rs.getString("eleid"));
				
				
				data.put(i, list);
				i++;
			} 
			System.out.println(data);
			con.close();
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}
	
	static public Map<Integer, List<String>> searchCar(String prop_name, String carNo) {
		Map<Integer, List<String>> data = new HashMap<Integer, List<String>>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM book_car where propname = ? AND car_no = ?;");
			pstmt.setString(1, prop_name);
			pstmt.setString(2, carNo);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("list--->"+rs);
			int i = 1;
			while (rs.next()) {
				List<String> list = new ArrayList<>();
				list.add(rs.getString("name"));
				list.add(rs.getString("mobile_nol"));
				list.add(rs.getString("car_no"));
				list.add(rs.getString("propname"));
				list.add(rs.getString("eleid"));
				data.put(i, list);
				i++;
			} 
			System.out.println(data);
			con.close();
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}
	
	static public Map<Integer, List<String>> bikedata(String prop_name) {
		Map<Integer, List<String>> data = new HashMap<Integer, List<String>>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM book_bike where propname = ?;");
			pstmt.setString(1, prop_name);
			ResultSet rs = pstmt.executeQuery();
			System.out.println("list--->"+rs);
			int i = 1;
			while (rs.next()) {
				List<String> list = new ArrayList<>();
				list.add(rs.getString("name"));
				list.add(rs.getString("mobile_nol"));
				list.add(rs.getString("bike_no"));
				list.add(rs.getString("propname"));
				list.add(rs.getString("eleid"));
				
				
				data.put(i, list);
				i++;
			} 
			System.out.println(data);
			con.close();
		} catch (SQLException e) { 
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}

	static public Map<Integer, String> getCarid(String prop_name) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("SELECT eleid FROM book_car where propname = ?;");
			pstmt.setString(1, prop_name);
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next()) {
				data.put(i, rs.getString("eleid"));
				i++;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}
	
	static public Map<Integer, String> getBikeid(String prop_name) {
		Map<Integer, String> data = new HashMap<Integer, String>();
		try {
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con.prepareStatement("SELECT eleid FROM book_bike where propname = ?;");
			pstmt.setString(1, prop_name);
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next()) {
				data.put(i, rs.getString("eleid"));
				i++;
			}
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}

	static public Map<String, String> getdashData(String prop_name) {
		Map<String, String> data = new HashMap<String, String>();
		try {
			int carSlot = 0;
			int bileSlot = 0;
			int totalCars = 0;
			int totalBikes = 0;
			
			Connection con = get_Connection.getdbConnection();
			PreparedStatement pstmt = con
					.prepareStatement("SELECT COUNT(eleid) FROM book_car where propname = ?;");
			pstmt.setString(1, prop_name);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				totalCars = Integer.parseInt(rs.getString("COUNT(eleid)"));
			}
			PreparedStatement pstmt1 = con
					.prepareStatement("SELECT COUNT(eleid) bikeCount FROM book_bike where propname = ?;");
			pstmt1.setString(1, prop_name);
			ResultSet rs1 = pstmt1.executeQuery();
			while (rs1.next()) {
				totalBikes = Integer.parseInt(rs1.getString("bikeCount"));
			}
			PreparedStatement pstmt2 = con
					.prepareStatement("SELECT car_slot,bike_slot  FROM vmps_parking where prop_name = ?;");
			pstmt2.setString(1, prop_name);
			ResultSet rs2 = pstmt2.executeQuery();
			while (rs2.next()) {
				carSlot = Integer.parseInt(rs2.getString("car_slot"));
				bileSlot = Integer.parseInt(rs2.getString("bike_slot"));
				System.out.println(carSlot + bileSlot);
			}
			con.close();

			int bikevac = bileSlot - totalBikes;
			int carvac =  carSlot - totalCars;
			data.put("totalCars", String.valueOf(totalCars));
			data.put("totalBikes", String.valueOf(totalBikes));
			data.put("vacBike", String.valueOf(bikevac));
			data.put("vacCar", String.valueOf(carvac));
			System.out.println(data);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// or something similar
		return data;
	}

}
