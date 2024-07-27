package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class LibraryUtil {
	public static Connection getDatabaseDetails() throws ClassNotFoundException, SQLException {
		Class.forName(Constants.DRIVER_URL);
		Connection con = DriverManager.getConnection(Constants.DB_PATH, Constants.DB_USERNAME, Constants.DB_PASSWORD);
		return con;
	}

}
