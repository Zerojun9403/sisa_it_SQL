package com.sisa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCTest {
    public static void main(String[] args) throws Exception {

        // 1. 드라이버 로딩
        Class.forName("com.mysql.cj.jdbc.Driver");

        // 2. 연결 객체 생성
        String url = "jdbc:mysql://localhost:3306/sisaDB?serverTimezone=Asia/Seoul";
        String user = "root";
        String password = "sisa";

        Connection conn = DriverManager.getConnection(url, user, password);
        System.out.println("DB 연결 성공");

        // 3. 실행 객체 생성
        Statement stmt = conn.createStatement();

        // 4. INSERT
        String insertSql =
            "insert into emp (empno, ename, sal) values (8002, '홍길동', 2700)";
        int result = stmt.executeUpdate(insertSql);
        System.out.println("INSERT 결과 행 수: " + result);

        // 5. SELECT (⭐ 반드시 SQL 필요)
        String selectSql = "select empno, ename, sal from emp";
        ResultSet rs = stmt.executeQuery(selectSql);

        // 6. 결과 조회
        while (rs.next()) {
            int empno = rs.getInt("empno");
            String ename = rs.getString("ename");
            int sal = rs.getInt("sal");

            System.out.println(empno + " / " + ename + " / " + sal);
        }

        // 7. 자원 해제
        rs.close();
        stmt.close();
        conn.close();
    }
}
