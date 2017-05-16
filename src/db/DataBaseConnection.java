package db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DataBaseConnection {
     
	public static final String DBDRIVER="org.gjt.mm.mysql.Driver";
	public static final String DBURL="jdbc:mysql://localhost:3306/medicine";
	public static final String DBNAME="root";
	public static final String DBPASS="adminthn";
	private Connection conn;
	public DataBaseConnection(){
		try {
			Class.forName(DBDRIVER);
			System.out.println("数据库驱动加载成功");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			conn=DriverManager.getConnection(DBURL,DBNAME,DBPASS);
			if(conn!=null){
	    		  System.out.println("数据库连接成功");
	    	  }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		public Connection getConnection(){
			return this.conn ;
		}
		public void close(){
			if(this.conn!=null){
				try {
					this.conn.close() ;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}
}