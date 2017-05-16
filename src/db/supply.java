package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Medi.supplyclass;

public class supply {
    private DataBaseConnection dbc = null;
	private Connection conn = null;
    public ArrayList<supplyclass> list=new ArrayList<supplyclass>();
	
	public supply() {
		this.dbc = new DataBaseConnection();
		this.conn = this.dbc.getConnection();
	}
	
	public boolean findAll() throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT supply_id,supply_name,address,telphone FROM supply";
		try {
			pstmt = this.conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // 执行查询操作
			while (rs.next()) {
				list.add(new supplyclass());
				list.get(list.size()-1).id=rs.getInt(1);
				list.get(list.size()-1).name=rs.getString(2);
				list.get(list.size()-1).address=rs.getString(3);
				list.get(list.size()-1).telphone=rs.getString(4);
			}
			rs.close() ;
		} catch (Exception e) {
			throw e;
		} finally { // 不管如何抛出，最终肯定是要进行数据库的关闭操作的
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e1) {

				}
			}
			this.dbc.close();
		}
		return true;
	}
}
