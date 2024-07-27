package com.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Utils.LibraryUtil;

public class LoginManager {
	public boolean signup(LoginBean loginBean) throws Exception {
		Connection con = LibraryUtil.getDatabaseDetails();

		PreparedStatement ps = con.prepareStatement("select email from login where email=?");
		ps.setString(1, loginBean.getEmail());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return false;
		} else {
			ps = con.prepareStatement("INSERT INTO login (email, password) VALUES (?, ?)");

			ps.setString(1, loginBean.getEmail());
			ps.setString(2, loginBean.getPassword());
			ps.execute();
			return true;
		}

	}

	public boolean login(LoginBean Bean) throws ClassNotFoundException, SQLException {
		Connection con = LibraryUtil.getDatabaseDetails();
		PreparedStatement ps = con.prepareStatement("select email,password from login where email=? and password=?");
		ps.setString(1, Bean.getEmail());
		ps.setString(2, Bean.getPassword());
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
			return true;
		} else {
			return false;
		}

	}

}
