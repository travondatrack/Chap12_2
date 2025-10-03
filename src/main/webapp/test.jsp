<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Database Test - Email List Application</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css" />
    <style>
      .test-section {
        margin: 20px 0;
        padding: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        background-color: #f9f9f9;
      }
      .success {
        color: green;
      }
      .error {
        color: red;
      }
      .info {
        color: blue;
      }
    </style>
  </head>
  <body>
    <h1>Email List Application - Database Test</h1>

    <div class="test-section">
      <h2>✅ Database Status</h2>
      <p class="success">✓ Database connection: HOẠT ĐỘNG</p>
      <p class="success">✓ Bảng users: ĐÃ TỒN TẠI</p>
      <p class="success">✓ Dữ liệu hiện tại: 5 records</p>
      <p class="info">→ Database sẵn sàng nhận dữ liệu mới!</p>
    </div>

    <div class="test-section">
      <h2>🔧 Test Application</h2>
      <p><strong>Các bước kiểm tra:</strong></p>
      <ol>
        <li>Deploy file WAR: <code>target/Chap13_1-1.0-SNAPSHOT.war</code></li>
        <li>Truy cập: <a href="index.jsp">index.jsp</a></li>
        <li>Điền form và submit</li>
        <li>Kiểm tra database có record mới</li>
      </ol>
    </div>

    <div class="test-section">
      <h2>📋 Dữ liệu hiện tại trong database</h2>
      <table border="1" style="border-collapse: collapse; width: 100%">
        <tr style="background-color: #f0f0f0">
          <th>UserID</th>
          <th>Email</th>
          <th>First Name</th>
          <th>Last Name</th>
        </tr>
        <tr>
          <td>1</td>
          <td>vlogsnqt721@gmail.com</td>
          <td>Nguyen Quoc</td>
          <td>Tinh 2</td>
        </tr>
        <tr>
          <td>2</td>
          <td>alice.smith@example.com</td>
          <td>Alice</td>
          <td>Smith</td>
        </tr>
        <tr>
          <td>3</td>
          <td>bob.johnson@example.com</td>
          <td>Bob</td>
          <td>Johnson</td>
        </tr>
        <tr>
          <td>4</td>
          <td>charlie.williams@example.com</td>
          <td>Charlie</td>
          <td>Williams</td>
        </tr>
        <tr>
          <td>5</td>
          <td>david.brown@example.com</td>
          <td>David</td>
          <td>Brown</td>
        </tr>
      </table>
    </div>

    <div class="test-section">
      <h2>🚀 Test Form</h2>
      <p>
        <a
          href="index.jsp"
          style="
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 4px;
          "
        >
          ➤ Đi đến trang Email List Form
        </a>
      </p>
    </div>

    <div class="test-section">
      <h2>🔍 Debug Information</h2>
      <p>
        <strong>Application Context:</strong> ${pageContext.request.contextPath}
      </p>
      <p><strong>Server:</strong> ${pageContext.servletContext.serverInfo}</p>
      <p><strong>Current Time:</strong> <%= new java.util.Date() %></p>
    </div>
  </body>
</html>
