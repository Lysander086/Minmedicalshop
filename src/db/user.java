package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import Medi.userclass;

public class user {
	public int id;
    public String name;
    public String password;
    public String title;
    public String webname;
    public HashMap<String,String> map=new HashMap<String,String>();;
    public ArrayList<userclass> list=new ArrayList<userclass>();
    private DataBaseConnection dbc = null;
	private Connection conn = null;

	public user() {
		this.dbc = new DataBaseConnection();
		this.conn = this.dbc.getConnection();
	}
	public boolean findAll() throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT custom_id,custom_name,custom_password,title,name FROM userinfo";
		try {
			pstmt = this.conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // 执行查询操作
			while (rs.next()) {
				list.add(new userclass());
				list.get(list.size()-1).id=rs.getInt(1);
				list.get(list.size()-1).name=rs.getString(2);
				list.get(list.size()-1).password=rs.getString(3);
				list.get(list.size()-1).title=rs.getString(4);
				list.get(list.size()-1).webname=rs.getString(5);
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
	
	public boolean doCreate(String rname,String password,String webname) throws Exception {            //添加
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO userinfo(custom_name,custom_password,name) VALUES (?,?,?) ";     
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, rname); 
			pstmt.setString(2, password);
			pstmt.setString(3, webname);
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
	
	public boolean findById(String myname) throws Exception {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "SELECT custom_id,custom_name,custom_password,title,name FROM userinfo WHERE custom_name=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, myname) ;
			ResultSet rs = pstmt.executeQuery(); // 执行查询操作
			if (rs.next()) {
				flag=true;
				id=rs.getInt(1);
				name=rs.getString(2);
				password=rs.getString(3);
				title=rs.getString(4);
				webname=rs.getString(5);
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
		return flag;
	}
	
	public boolean findByTitle(String Title) throws Exception {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "SELECT custom_id,custom_name,custom_password,title,name FROM userinfo WHERE title=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, Title) ;
			ResultSet rs = pstmt.executeQuery(); // 执行查询操作
			while (rs.next()) {
				list.add(new userclass());
				list.get(list.size()-1).id=rs.getInt(1);
				list.get(list.size()-1).name=rs.getString(2);
				list.get(list.size()-1).password=rs.getString(3);
				list.get(list.size()-1).title=rs.getString(4);
				list.get(list.size()-1).webname=rs.getString(5);
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
		return flag;
	}
	
	public boolean findByWebname(String myname) throws Exception {
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "SELECT custom_id,custom_name,custom_password,title,name FROM userinfo WHERE name=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, myname) ;
			ResultSet rs = pstmt.executeQuery(); // 执行查询操作
			if (rs.next()) {
				flag=true;
				id=rs.getInt(1);
				name=rs.getString(2);
				password=rs.getString(3);
				title=rs.getString(4);
				webname=rs.getString(5);
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
		return flag;
	}
	
	public boolean doUpdate(String webname,String name,String password) throws Exception {     
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "UPDATE userinfo SET custom_name=?,custom_password=?,name=? WHERE name=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, password); 
			pstmt.setString(3, webname);
			pstmt.setString(4, webname);
			if (pstmt.executeUpdate() > 0) {
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
	
	public boolean doUpdate(int id,String name,String password,String title,String webname) throws Exception {     
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "UPDATE userinfo SET custom_name=?,custom_password=?,title=?,name=? WHERE custom_id=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, password); 
			pstmt.setString(3, title);
			pstmt.setString(4, webname);
			pstmt.setInt(5, id);
			if (pstmt.executeUpdate() > 0) {
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
	
	public boolean doDelete(int id) throws Exception {       //按ID删除
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM userinfo WHERE custom_id=? ";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id); // 所有的内容从user类中取出
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
