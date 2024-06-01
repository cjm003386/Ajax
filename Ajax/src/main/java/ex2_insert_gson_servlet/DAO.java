package ex2_insert_gson_servlet;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
/*
 * DAO(Data Access Object) 클래스
 * -데이터 베이스와 연동하여 레코드의 추가, 수정, 삭제 작업이 이루어지는 클래스 입니다.
 * 
 */

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;



public class DAO {
	
	private DataSource ds;
	
	//생성자에서 JNDI 리소스를 참조하여 Connection 객체를 얻어옵니다.
	public DAO() {
		try {
			Context init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		}catch (Exception ex) {
			System.out.println("DB 연결 실패 : " + ex);
		}
	}
	
	
//	public JsonArray getList_lib() {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		JsonArray array = new JsonArray();
//		try {
//			con = ds.getConnection();
//			
//			String sql = "select * from dept order by deptno";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//				JsonObject obj = new JsonObject();
//				obj.addProperty("deptno", rs.getInt(1));
//				obj.addProperty("dname", rs.getString(2));
//				obj.addProperty("loc", rs.getString(3));
//				array.add(obj);
//			}
//			
//	}catch (Exception se) {
//		se.printStackTrace();
//	}finally {
//		try {
//			if (pstmt != null)
//				pstmt.close();
//		} catch (SQLException e) {
//			System.out.println(e.getMessage());
//		}
//		try {
//			if (con != null)
//				con.close();
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
//	}
//		return array;
//	}
//
//
//	public JsonArray getList_lib_bean() {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		JsonArray array = new JsonArray();
//		try {
//			con = ds.getConnection();
//			
//			String sql = "select * from dept order by deptno";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			while (rs.next()) {
//				//Dept를 이용해서 저장합니다.
//				Dept dept = new Dept();
//				dept.setDeptno(rs.getInt(1));
//				dept.setDname(rs.getString(2));
//				dept.setLoc(rs.getString(3));
//				
//				//JsonElement com.google.gson.Gson.toJsonTree(Object src);
//				JsonElement j = new Gson().toJsonTree(dept);
//				array.add(j); //JsonElement형을 요구합니다.
//				
//			}
//			
//	}catch (Exception se) {
//		se.printStackTrace();
//	}finally {
//		try {
//			if (pstmt != null)
//				pstmt.close();
//		} catch (SQLException e) {
//			System.out.println(e.getMessage());
//		}
//		try {
//			if (con != null)
//				con.close();
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
//	}
//		return array;
//	}
//
//
//	public JsonArray getList_lib_search(int deptno) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		JsonArray array = new JsonArray();
//		try {
//			con = ds.getConnection();
//			
//			String sql = "select * from dept where deptno = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, deptno);
//			rs = pstmt.executeQuery();
//			
//			int i = 0;
//			while (rs.next()) { //더 이상 읽을 데이터가 없을 때 까지 반복
//				
//				JsonObject obj = new JsonObject();
//				obj.addProperty("deptno", rs.getInt(1));
//				obj.addProperty("dname", rs.getString(2));
//				obj.addProperty("loc", rs.getString(3));
//				array.add(obj);
//			}
//			
//	}catch (Exception se) {
//		se.printStackTrace();
//	}finally {
//		try {
//			if (pstmt != null)
//				pstmt.close();
//		} catch (SQLException e) {
//			System.out.println(e.getMessage());
//		}
//		try {
//			if (con != null)
//				con.close();
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		}
//	}
//		return array;
//	}


	public JsonArray getList() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JsonArray array = new JsonArray();
		try {
			con = ds.getConnection();
			
			String sql = "select * from products order by id";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				JsonObject obj = new JsonObject();
				obj.addProperty("id", rs.getInt(1));
				obj.addProperty("name", rs.getString(2));
				obj.addProperty("price", rs.getInt(3));
				obj.addProperty("maker", rs.getString(4));
				array.add(obj);
			}
			
	}catch (Exception se) {
		se.printStackTrace();
	}finally {
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		try {
			if (con != null)
				con.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
		return array;
	}


	public int insert(VO v) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int result = 0;//초기값
		try {
			con = ds.getConnection();
			
			String sql = "INSERT INTO products"
					   + " VALUES ("
					   + " 			(select nvl(max(id),0)+1 from products), ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, v.getName());
			pstmt.setInt(2, v.getPrice());
			pstmt.setString(3, v.getMaker());
			result = pstmt.executeUpdate();
			
		}catch (Exception se) {
				se.printStackTrace();
			}finally {
				try {
					if (pstmt != null)
						pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
				try {
					if (con != null)
						con.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
				return result;
	}


	public int update(VO vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		int result = 0;//초기값
		try {
			con = ds.getConnection();
			
			String sql = "update products"
					   + " set name = ?,price = ?,maker = ?"
					   + " where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setInt(2, vo.getPrice());
			pstmt.setString(3, vo.getMaker());
			pstmt.setInt(4, vo.getId());
			result = pstmt.executeUpdate();
			
		}catch (Exception se) {
				se.printStackTrace();
			}finally {
				try {
					if (pstmt != null)
						pstmt.close();
				} catch (SQLException e) {
					System.out.println(e.getMessage());
				}
				try {
					if (con != null)
						con.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
				return result;
	}


	public int delete(int id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		int result = 0;// 초기값
		try {
			con = ds.getConnection();
			String sql = "delete products" + " where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			result = pstmt.executeUpdate();
		
		} catch (Exception se) {
			se.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
			try {
				if (con != null)
					con.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}






	







	


	

	


