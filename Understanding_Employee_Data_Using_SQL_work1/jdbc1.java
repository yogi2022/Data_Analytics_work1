// java -cp "mysql-connector-java-8.0.16.jar;." jdbc1

import java.sql.*;

class jdbc1 {
  static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
  static final String DB_URL = "jdbc:mysql://localhost/test";
    
  static final String USER = "root";
  static final String PASS = "root";
     
  public static void main(String[] args) throws SQLException {  
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    try{
      Class.forName("com.mysql.jdbc.Driver");
      System.out.println("Connecting to database...");

      conn = DriverManager.getConnection(DB_URL,USER,PASS);
      System.out.println("Creating statement...");

      stmt = conn.createStatement();
      String sql;
      sql = "SELECT empno, ename, sal from emp where empno > 7600";
      rs = stmt.executeQuery(sql);

      while(rs.next()){
        int empno  = rs.getInt("EMPNO");
        String name = rs.getString("ENAME");
        int sal=rs.getInt("sal");
        System.out.print(" empno : " +empno);
        System.out.print(" name : " + name);
        System.out.println(" sal : " + sal);
      }

      String update="update emp set sal=sal+500";
      int result = stmt.executeUpdate(update);
      System.out.println("result " + result);

      sql = "SELECT empno, ename, sal from emp where empno > 7600";
      rs = stmt.executeQuery(sql);

      System.out.println("After update");
      while(rs.next()){
        int empno  = rs.getInt("EMPNO");
        String name = rs.getString("ENAME");
        int sal=rs.getInt("sal");
        System.out.print(" empno : " +empno);
        System.out.print(" name : " + name);
        System.out.println(" sal : " + sal);
      }
    }   
    catch(SQLException e){
      e.printStackTrace();
    }
	catch(ClassNotFoundException e){
      e.printStackTrace();
    }
    finally
    {
		rs.close();
		stmt.close();
		conn.close();
    }
  }
}     
