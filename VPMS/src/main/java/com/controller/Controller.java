package com.controller;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.model.vpmsUtil;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		if (flag!=null  && flag.equals("searchParking")) {
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			Map<Integer, String> data = vpmsUtil.getParkingList(city, state);
			request.setAttribute("prop", data);
			RequestDispatcher dispatcher = request.getRequestDispatcher("avalpark.jsp");
			dispatcher.forward(request, response);
		} else if(flag.equals("open login")){
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
			dispatcher.forward(request, response);
		}
		
		else if (flag.equals("carSlot")) {
			String parkName = request.getParameter("parkName");
			Map<Integer, String> data = vpmsUtil.getCarSlot(parkName);
			System.out.println(data.get(2));
			if(data.get(2) != null) {
			
			request.setAttribute("slot", Integer.parseInt(data.get(2)));
			}
			request.setAttribute("prop", data.get(1));
			System.out.println("prop_name===>" + data.get(1));
			RequestDispatcher dispatcher = request.getRequestDispatcher("carSlots.jsp");
			dispatcher.forward(request, response);
		} else if (flag.equals("bookCar")) {
			String Name = request.getParameter("Name");
			String carNo = request.getParameter("carNo");
			String propName = request.getParameter("propName");
			String mobile_num = request.getParameter("mobile_num");
			String eleId = request.getParameter("eleId");
			Map<Integer, String> data = vpmsUtil.bookCar(Name, carNo, propName, mobile_num, eleId);
			System.out.println(data.get(1));
			if (data.get(1).equals("AlreadyBooked")) {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("AlreadyBooked");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("Booked");
			}

		} else if (flag.equals("prop_SignUp")) {
			String prop_Name = request.getParameter("prop_Name");
			String userID = request.getParameter("userID");
			String carSlot = request.getParameter("carSlot");
			String bikeSlot = request.getParameter("bikeSlot");
			String city = request.getParameter("city");
			String State = request.getParameter("State");
			String emailAddress = request.getParameter("emailAddress");
			String passWord = request.getParameter("passWord");
			Map<Integer, String> data = vpmsUtil.prop_SignUp(prop_Name, userID, carSlot, bikeSlot, city, State,
					emailAddress, passWord);
			System.out.println(data.get(1));
			if (data.get(1).equals("AlreadyReg")) {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("Already_Reg");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("Booked");
			}

		} else if (flag.equals("login")) {
			String emailAddress = request.getParameter("emailAddress");
			String password = request.getParameter("password");
			Map<Integer, String> data = vpmsUtil.login(emailAddress, password);
			HttpSession session = request.getSession(true);
			System.out.println(data.get(1));
			if (data.get(1).equals("Logined")) {
				request.setAttribute("prop", data.get(2));
				RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
				dispatcher.forward(request, response);
			} else if (data.get(1).equals("Logined failed")) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
				dispatcher.forward(request, response);
			}
		} else if (flag.equals("logout")) {
			HttpSession session = request.getSession(true);
			session.invalidate();
			response.sendRedirect("login.html");
		} else if (flag.equals("bikeSlot")) {
			String parkName = request.getParameter("parkName");
			Map<Integer, String> data = vpmsUtil.getbikeSlot(parkName);
			System.out.println(data.get(2));
			request.setAttribute("slot", Integer.parseInt(data.get(2)));
			request.setAttribute("prop", data.get(1));
			System.out.println("prop_name===>" + data.get(1));
			RequestDispatcher dispatcher = request.getRequestDispatcher("bikeslot.jsp");
			dispatcher.forward(request, response);
		} else if (flag.equals("bookbike")) {
			String Name = request.getParameter("Name");
			String bikeNo = request.getParameter("bikeNo");
			String propName = request.getParameter("propName");
			String mobile_num = request.getParameter("mobile_num");
			String eleId = request.getParameter("eleId");
			Map<Integer, String> data = vpmsUtil.bookbike(Name, bikeNo, propName, mobile_num, eleId);
			JSONObject json = new JSONObject(data);
			System.out.println(json);
			System.out.println(data.get(1));
			if (data.get(1).equals("AlreadyBooked")) {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("AlreadyBooked");
			} else {
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().write("Booked"); 
			}

		} else if (flag.equals("getCarid")) {
			String propName = request.getParameter("propName");
			Map<Integer, String> data = vpmsUtil.getCarid(propName);
			JSONObject json = new JSONObject(data);
			System.out.println(json);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(json.toString());

		} else if (flag.equals("getBikeid")) {
			String propName = request.getParameter("propName");
			Map<Integer, String> data = vpmsUtil.getBikeid(propName);
			JSONObject json = new JSONObject(data);
			System.out.println(json);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(json.toString());

		} else if (flag.equals("getDashData")) {
			String otp = new DecimalFormat("000000").format(new Random().nextInt(999999));
			System.out.println(otp);
			Map<String, String> data = new HashMap<String, String>();
			String propName = request.getParameter("propName");
			data = vpmsUtil.getdashData(propName);
			JSONObject json = new JSONObject(data);
			System.out.println(json);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(json.toString());
		} else if (flag.equals("getcarData")) {
			Map<Integer, List<String>> data = new HashMap<Integer, List<String>>();
			String propName = request.getParameter("propName");
			data = vpmsUtil.cardata(propName);
			JSONObject json = new JSONObject(data);
			System.out.println(json);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(json.toString());
		} else if (flag.equals("getbikeData")) {
			Map<Integer, List<String>> data = new HashMap<Integer, List<String>>();
			String propName = request.getParameter("propName");
			System.out.println(propName);
			data = vpmsUtil.bikedata(propName);
			JSONObject json = new JSONObject(data);
			System.out.println(json);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(json.toString());
		}else if (flag.equals("searchCar")) {
			Map<Integer, List<String>> data = new HashMap<Integer, List<String>>();
			String propName = request.getParameter("propName");
			String carNo = request.getParameter("carNo");
			data = vpmsUtil.searchCar(propName, carNo);
			JSONObject json = new JSONObject(data);
			System.out.println(json);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(json.toString());
		}else if (flag.equals("searchBike")) {
			Map<Integer, List<String>> data = new HashMap<Integer, List<String>>();
			String propName = request.getParameter("propName");
			data = vpmsUtil.bikedata(propName);
			JSONObject json = new JSONObject(data);
			System.out.println(json);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().write(json.toString());
		}else if (flag.equals("carDel")) {
			HttpSession session = request.getSession(false);
			String propName = request.getParameter("prop");
			String carNo = request.getParameter("carNo");
			vpmsUtil.carDel(propName, carNo);
			request.setAttribute("prop", propName);
			RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
			dispatcher.forward(request, response);
		}else if (flag.equals("bikeDel")) {
			HttpSession session = request.getSession(false);
			String propName = request.getParameter("prop");
			String bikeNo = request.getParameter("bikeNo");
			vpmsUtil.bikeDel(propName, bikeNo);
			request.setAttribute("prop", propName);
			RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
			dispatcher.forward(request, response);
		}

//		String a = request.getParameter("city");
//		String b = request.getParameter("state");
//		System.out.println(a + b);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("avalpark.html");
//		dispatcher.forward(request, response);

	}

}
