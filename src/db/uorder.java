package db;
//���û��������в�����д�˶�������Ĳ�����
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Medi.morderclass;
import Medi.uorderclass;
import Medi.uordermedi;
import Medi.userclass;

public class uorder {
    public  ArrayList<uorderclass> list=new ArrayList<uorderclass>();
    public  ArrayList<uordermedi> list2=new ArrayList<uordermedi>();
    private DataBaseConnection dbc = null;
	private Connection conn = null;

	public uorder() {
		this.dbc = new DataBaseConnection();
		this.conn = this.dbc.getConnection();
	}
	
	public boolean findAll() throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT u_order_id,u_order_date,custom_name,u_order_sumprice FROM u_order";
		try {
			pstmt = this.conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // ִ�в�ѯ����
			while (rs.next()) {
				 list.add(new uorderclass());
				 list.get(list.size()-1).id=rs.getInt(1);
				 list.get(list.size()-1).date=rs.getString(2);          
				 list.get(list.size()-1).customname=rs.getString(3);
				 list.get(list.size()-1).sumprice=rs.getDouble(4);			 
			}
			rs.close() ;
		} catch (Exception e) {
			throw e;
		} finally { // ��������׳������տ϶���Ҫ�������ݿ�Ĺرղ�����
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
	
	
	
	
	public boolean doCreate(String date,String custom,double sumprice) throws Exception {            //���
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO u_order(u_order_date,custom_name,u_order_sumprice) VALUES (?,?,?) ";     
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, date); 
			pstmt.setString(2, custom);
			pstmt.setDouble(3, sumprice);
//			pstmt.setInt(3, numberkind);
//			pstmt.setDouble(3, sprice);
			if (pstmt.executeUpdate() > 0) {// �����Ѿ�������һ��
				flag = true;
			}
		} catch (Exception e) {
			throw e;
		} finally { // ��������׳������տ϶���Ҫ�������ݿ�Ĺرղ�����
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
	
	public boolean findByodId(int id) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT orderid,mediname,medinum FROM uordermedi WHERE orderid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id) ;
			ResultSet rs = pstmt.executeQuery(); // ִ�в�ѯ����
			while (rs.next()) {
				 list2.add(new uordermedi());
				 list2.get(list2.size()-1).orderid=rs.getInt(1);
				 list2.get(list2.size()-1).mediname=rs.getString(2);
				 list2.get(list2.size()-1).medinum=rs.getInt(3);
			}
			rs.close() ;
		} catch (Exception e) {
			throw e;
		} finally { // ��������׳������տ϶���Ҫ�������ݿ�Ĺرղ�����
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
	
	
	public boolean doCreate2(int orderid,String medicinename,int medicinenum) throws Exception {            //���
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO uordermedi(orderid,mediname,medinum) VALUES (?,?,?) ";     
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, orderid); 
			pstmt.setString(2, medicinename);
			pstmt.setInt(3, medicinenum);
			if (pstmt.executeUpdate() > 0) {// �����Ѿ�������һ��
				flag = true;
			}
		} catch (Exception e) {
			throw e;
		} finally { // ��������׳������տ϶���Ҫ�������ݿ�Ĺرղ�����
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
	
	public boolean findLast() throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT MAX(u_order_id) from u_order";
		try {
			pstmt = this.conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); // ִ�в�ѯ����
			if (rs.next()) {
				 list.add(new uorderclass());
				 list.get(list.size()-1).id=rs.getInt(1);
			}
			rs.close() ;
		} catch (Exception e) {
			throw e;
		} finally { // ��������׳������տ϶���Ҫ�������ݿ�Ĺرղ�����
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
	
	public boolean findByName(String name) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT u_order_id,u_order_date,custom_name,u_order_sumprice FROM u_order WHERE custom_name=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, name) ;
			ResultSet rs = pstmt.executeQuery(); // ִ�в�ѯ����
			while (rs.next()) {
				 list.add(new uorderclass());
				 list.get(list.size()-1).id=rs.getInt(1);
				 list.get(list.size()-1).date=rs.getString(2);
				 list.get(list.size()-1).customname=rs.getString(3);
				 list.get(list.size()-1).sumprice=rs.getDouble(4);
			}
			rs.close() ;
		} catch (Exception e) {
			throw e;
		} finally { // ��������׳������տ϶���Ҫ�������ݿ�Ĺرղ�����
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
	
	
	public boolean findById(int id) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT u_order_date,custom_name,u_order_sumprice FROM u_order WHERE u_order_id=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id) ;
			ResultSet rs = pstmt.executeQuery(); // ִ�в�ѯ����
			while (rs.next()) {
				 list.add(new uorderclass());
				 list.get(list.size()-1).id=rs.getInt(1);
				 list.get(list.size()-1).date=rs.getString(2);
				 list.get(list.size()-1).customname=rs.getString(3);
				 list.get(list.size()-1).sumprice=rs.getDouble(4);
			}
			rs.close() ;
		} catch (Exception e) {
			throw e;
		} finally { // ��������׳������տ϶���Ҫ�������ݿ�Ĺرղ�����
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