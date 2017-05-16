package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Medi.morderclass;



public class morder {
	    public ArrayList<morderclass> list=new ArrayList<morderclass>();
	    private DataBaseConnection dbc = null;
		private Connection conn = null;                            

		public morder() {
			this.dbc = new DataBaseConnection();
			this.conn = this.dbc.getConnection();
		}

		public boolean findAll() throws Exception {
			PreparedStatement pstmt = null;
			String sql = "SELECT m_order_id,m_order_date,supply_name,m_medicine,m_number,"
					+ "m_order_sumprice,managename FROM m_order";
			try {
				pstmt = this.conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery(); // 执行查询操作
				while (rs.next()) {
					 list.add(new morderclass());
					 list.get(list.size()-1).id=rs.getInt(1);
					 list.get(list.size()-1).date=rs.getString(2);          
					 list.get(list.size()-1).supplyname=rs.getString(3);
					 list.get(list.size()-1).medicine=rs.getString(4);
					 list.get(list.size()-1).m_number=rs.getInt(5);
					 list.get(list.size()-1).sumprice=rs.getDouble(6);
					 list.get(list.size()-1).managename=rs.getString(7);				 
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
		
		public boolean doCreate(String date,String supply,String medicine,int number,double sumprice,String managename) throws Exception {            //添加
			boolean flag = false;
			PreparedStatement pstmt = null;
			String sql = "INSERT INTO m_order(m_order_date,supply_name,m_medicine,m_number,"
					+ "m_order_sumprice,managename) VALUES (?,?,?,?,?,?) ";     
			try {
				pstmt = this.conn.prepareStatement(sql);
				pstmt.setString(1, date); 
				pstmt.setString(2, supply);
				pstmt.setString(3, medicine);
				pstmt.setInt(4, number);
				pstmt.setDouble(5, sumprice);
				pstmt.setString(6, managename);
				if (pstmt.executeUpdate() > 0) {// 至少已经更新了一行
					flag = true;
				}
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
			return flag;
		}
}
