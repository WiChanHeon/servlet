package memberone;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;
public class StudentDAO {
	private static StudentDAO instance = null;//멤버필드
	private StudentDAO(){}//생성자
	public static StudentDAO getInstance(){//메소드
		if(instance == null){
			synchronized(StudentDAO.class){
				instance = new StudentDAO();
			}
		}
		return instance;
	}
	
	private Connection getConnection(){
		Connection conn = null;
		try {
			Context init = new InitialContext();
			DataSource ds =
					(DataSource)init.lookup("java:comp/env/jdbc/myOracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.err.println("Connectiton 생성실패");
		}
		
		return conn;
	}
	
	public boolean idCheck(String id){//아이디 중복확인 메소드
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from student where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(!rs.next()) result = false;
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			if(rs != null)try{rs.close();}catch(SQLException sqle1){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle2){}
			if(conn != null)try{conn.close();}catch(SQLException sqle3){}
		}
		return result;
	}
	
	public Vector<ZipCodeVO> zipcodeRead(String dong){//우편번호 검색 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<ZipCodeVO> vecList = new Vector<ZipCodeVO>();
		try {
			conn = getConnection();
			System.out.println(dong);
			String strQuery =
					"select * from zipcode where dong like '" + dong + "%'";
			pstmt = conn.prepareStatement(strQuery);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ZipCodeVO tempZipcode = new ZipCodeVO();
				tempZipcode.setZipcode(rs.getString("zipcode"));
				tempZipcode.setSido(rs.getString("sido"));
				tempZipcode.setGugun(rs.getString("gugun"));
				tempZipcode.setDoro(rs.getString("doro"));
				tempZipcode.setBdno(rs.getString("bdname"));
				tempZipcode.setBdname(rs.getString("bdname"));
				tempZipcode.setDong(rs.getString("dong"));
				tempZipcode.setBunji1(rs.getString("bunji1"));
				vecList.addElement(tempZipcode);
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		}finally {
			if(rs != null)try{rs.close();}catch(SQLException sqle1){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle2){}
			if(conn != null)try{conn.close();}catch(SQLException sqle3){}
		}
		
		return vecList;
	}
	
	public boolean memberInsert(StudentVO vo){//신규 회원가입 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean flag = false;
		try {			
			conn = getConnection();
			String strQuery = "insert into student values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getPhone1());
			pstmt.setString(5, vo.getPhone2());
			pstmt.setString(6, vo.getPhone3());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getZipcode());
			pstmt.setString(9, vo.getAddress1());
			pstmt.setString(10, vo.getAddress2());
			
			int count = pstmt.executeUpdate();
			if(count>0)flag = true;
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}finally {
			if(rs != null)try{rs.close();}catch(SQLException sqle1){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle2){}
			if(conn != null)try{conn.close();}catch(SQLException sqle3){}
		}
		return flag;
	}
	
	public int loginCheck(String id,String pass){//로그인 검사 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int check = -1;//아이디없음
		
		try {
			conn = getConnection();
			String strQuery = "select pass from student where id = ?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String dbPass = rs.getString("pass");
				if(pass.equals(dbPass)) check = 1;//로그인 성공
				else					check = 0;//비밀번호 오류
			}
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}finally {
			if(rs != null)try{rs.close();}catch(SQLException sqle1){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle2){}
			if(conn != null)try{conn.close();}catch(SQLException sqle3){}
		}
		return check;
	}
	
	public StudentVO getMember(String id){//회원 정보 가져오기 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentVO vo = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from student where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){//해당 아이디에 대한 회원이 존재
				vo = new StudentVO();
				vo.setId(rs.getString("id"));
				vo.setPass(rs.getString("pass"));
				vo.setName(rs.getString("name"));
				vo.setPhone1(rs.getString("phone1"));
				vo.setPhone2(rs.getString("phone2"));
				vo.setPhone3(rs.getString("phone3"));
				vo.setEmail(rs.getString("email"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddress1(rs.getString("Address1"));
				vo.setAddress2(rs.getString("Address2"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null)try{rs.close();}catch(SQLException sqle1){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle2){}
			if(conn != null)try{conn.close();}catch(SQLException sqle3){}
		}
		return vo;
	}
	
	public void updateMember(StudentVO vo){//회원 정보 업데이트 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update student set pass=?,phone1=?,phone2=?,phone3=?,email=?,zipcode=?,address1=?,address2=? where id=?");
			pstmt.setString(1, vo.getPass());
			pstmt.setString(2, vo.getPhone1());
			pstmt.setString(3, vo.getPhone2());
			pstmt.setString(4, vo.getPhone3());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getZipcode());
			pstmt.setString(7, vo.getAddress1());
			pstmt.setString(8, vo.getAddress2());
			pstmt.setString(9, vo.getId());
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle2){}
			if(conn != null)try{conn.close();}catch(SQLException sqle3){}
		}
	}
	
	public int deleteMember(String id,String pass){//회원 탈퇴 메소드
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbPass = "";//데이터 베이스에 실제 저장된 패스워드
		int result = -1;//결과치
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select pass from student where id = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dbPass = rs.getString("pass");
				if(pass.equals(dbPass)){//true - 본인 확인
					pstmt = conn.prepareStatement("delete from student where id = ?");
					pstmt.setString(1, id);
					pstmt.executeUpdate();
					result = 1;//회원 탈퇴 성공
				}else{//본인확인 실패 - 비밀 번호 오류
					result = 0;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}finally {
			if(rs != null)try{rs.close();}catch(SQLException sqle1){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException sqle2){}
			if(conn != null)try{conn.close();}catch(SQLException sqle3){}
		}
		return result;
	}
}
