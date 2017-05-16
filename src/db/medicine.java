package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Medi.Medi;

public class medicine {
    public ArrayList<Medi> list=new ArrayList<Medi>();
    private DataBaseConnection dbc = null;
	private Connection conn = null;                            //

	public medicine() {
		this.dbc = new DataBaseConnection();
		this.conn = this.dbc.getConnection();
	}
	public boolean findAll() throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT m_id,m_name,m_outprice,m_number,production_date,quality_time,m_kind,supply_name,m_inprice FROM medicine";
		try {
			pstmt = this.conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // 执行查询操作
			while (rs.next()) {
				 list.add(new Medi());
				 list.get(list.size()-1).id=rs.getInt(1);
				 list.get(list.size()-1).name=rs.getString(2);
				 list.get(list.size()-1).outprice=rs.getDouble(3);
				 list.get(list.size()-1).number=rs.getInt(4);
				 list.get(list.size()-1).production=rs.getString(5);
				 list.get(list.size()-1).quality=rs.getString(6);
				 list.get(list.size()-1).kind=rs.getString(7);
				 list.get(list.size()-1).supplyname=rs.getString(8);
				 list.get(list.size()-1).inprice=rs.getDouble(9);
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
	
	public boolean doCreate(String name,double outprice,int number,String production,String quality,String kind,String supply,double inprice) throws Exception {            //添加
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO medicine(m_name,m_outprice,m_number,production_date,"
				+ "quality_time,m_kind,supply_name,m_inprice) VALUES (?,?,?,?,?,?,?,?) ";     
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, name); 
			pstmt.setDouble(2, outprice);
			pstmt.setInt(3, number);
			pstmt.setString(4, production);
			pstmt.setString(5, quality);
			pstmt.setString(6, kind);
			pstmt.setString(7, supply);
			pstmt.setDouble(8, inprice);
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
	
	
	public boolean findById(int id) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT m_id,m_name,m_outprice,m_number,production_date,quality_time,m_kind,supply_name,m_inprice FROM medicine where m_id=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id) ;
			ResultSet rs = pstmt.executeQuery(); // 执行查询操作
			if (rs.next()) {
				 list.add(new Medi());
				 list.get(list.size()-1).id=rs.getInt(1);
				 list.get(list.size()-1).name=rs.getString(2);
				 list.get(list.size()-1).outprice=rs.getDouble(3);
				 list.get(list.size()-1).number=rs.getInt(4);
				 list.get(list.size()-1).production=rs.getString(5);
				 list.get(list.size()-1).quality=rs.getString(6);
				 list.get(list.size()-1).kind=rs.getString(7);
				 list.get(list.size()-1).supplyname=rs.getString(8);
				 list.get(list.size()-1).inprice=rs.getDouble(9);
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
	
	
	public boolean doUpdate(int mid,String name,double outprice,int number,String production,String quality,String kind,String supply,double inprice) throws Exception {       //更新修改
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "UPDATE medicine SET m_name=?,m_outprice=?,m_number=?,production_date=?,"
				+ "quality_time=?,m_kind=?,supply_name=?,m_inprice=? WHERE m_id=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, name); 
			pstmt.setDouble(2, outprice); 
			pstmt.setInt(3, number);
			pstmt.setString(4, production);
			pstmt.setString(5, quality);
			pstmt.setString(6, kind);
			pstmt.setString(7, supply);
			pstmt.setDouble(8, inprice);
			pstmt.setInt(9, mid);
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
	
	public boolean doUpdate(int id,int num) throws Exception {       //更新修改
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "UPDATE medicine SET m_number=? WHERE m_id=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, id);
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
	
	public boolean doUpdate(String name,int num) throws Exception {       //更新修改
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "UPDATE medicine SET m_number=m_number-? WHERE m_name=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, name);
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
	
	public boolean doDelete(int mid) throws Exception {       //按ID删除
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM medicine WHERE m_id=? ";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, mid); // 所有的内容从user类中取出
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
