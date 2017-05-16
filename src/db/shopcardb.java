package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Medi.shopcar;

public class shopcardb {
    public  ArrayList<shopcar> list=new ArrayList<shopcar>();
    private DataBaseConnection dbc = null;
	private Connection conn = null;

	public shopcardb() {
		this.dbc = new DataBaseConnection();
		this.conn = this.dbc.getConnection();
	}
	
	public boolean doUpdate(int id,int number) throws Exception {       //�����޸�
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "UPDATE shopcar SET m_number=? WHERE shopid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, number); 
			pstmt.setInt(2, id); 

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
	
	
	
	public boolean doCreate(String customname,String mname,double moutprice) throws Exception {            //���
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO shopcar(custom_name,m_name,outprice) VALUES (?,?,?) ";     
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, customname); 
			pstmt.setString(2, mname);
			pstmt.setDouble(3, moutprice);
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
	
	
	public boolean findByName(String custom) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "SELECT shopid,custom_name,m_name,m_number,outprice FROM shopcar WHERE custom_name=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, custom) ;
			ResultSet rs = pstmt.executeQuery(); // ִ�в�ѯ����
			while (rs.next()) {
				 list.add(new shopcar());
				 list.get(list.size()-1).id=rs.getInt(1);
				 list.get(list.size()-1).custom_name=rs.getString(2);
				 list.get(list.size()-1).m_name=rs.getString(3);
				 list.get(list.size()-1).m_number=rs.getInt(4);
				 list.get(list.size()-1).outprice=rs.getDouble(5);
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
		String sql = "SELECT shopid,custom_name,m_name,m_number,outprice FROM shopcar WHERE shopid=?";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id) ;
			ResultSet rs = pstmt.executeQuery(); // ִ�в�ѯ����
			while (rs.next()) {
				 list.add(new shopcar());
				 list.get(list.size()-1).id=rs.getInt(1);
				 list.get(list.size()-1).custom_name=rs.getString(2);
				 list.get(list.size()-1).m_name=rs.getString(3);
				 list.get(list.size()-1).m_number=rs.getInt(4);
				 list.get(list.size()-1).outprice=rs.getDouble(5);
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
		
	public boolean doDelete(int id) throws Exception {       //��IDɾ��
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM shopcar WHERE shopid=? ";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setInt(1, id); // ���е����ݴ�user����ȡ��
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
	
	public boolean doDelete(String customname,String m_name) throws Exception {       //��IDɾ��
		boolean flag = false;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM shopcar WHERE custom_name=? and m_name=? ";
		try {
			pstmt = this.conn.prepareStatement(sql);
			pstmt.setString(1, customname);
			pstmt.setString(2, m_name);
			if (pstmt.executeUpdate() > 0) {
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

}
