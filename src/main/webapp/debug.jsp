<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Render Deployment Test</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        margin: 40px;
        background-color: #f8f9fa;
      }
      .container {
        max-width: 800px;
        margin: 0 auto;
      }
      .status {
        padding: 15px;
        margin: 10px 0;
        border-radius: 5px;
      }
      .success {
        background-color: #d4edda;
        color: #155724;
        border: 1px solid #c3e6cb;
      }
      .info {
        background-color: #d1ecf1;
        color: #0c5460;
        border: 1px solid #bee5eb;
      }
      .warning {
        background-color: #fff3cd;
        color: #856404;
        border: 1px solid #ffeaa7;
      }
      .error {
        background-color: #f8d7da;
        color: #721c24;
        border: 1px solid #f5c6cb;
      }
      a {
        color: #007bff;
        text-decoration: none;
      }
      a:hover {
        text-decoration: underline;
      }
      .code {
        background-color: #f1f1f1;
        padding: 10px;
        border-radius: 3px;
        font-family: monospace;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>🚀 Render Deployment Test</h1>

      <div class="status success">
        <h3>✅ Application Status</h3>
        <p><strong>Deployment:</strong> SUCCESS</p>
        <p><strong>Tomcat Version:</strong> Apache Tomcat/10.1.46</p>
        <p><strong>URL:</strong> https://chap13-1.onrender.com</p>
        <p><strong>Context Path:</strong> ROOT (deployed as /)</p>
      </div>

      <div class="status info">
        <h3>📍 Available URLs</h3>
        <ul>
          <li>
            <strong>Home:</strong>
            <a href="/">https://chap13-1.onrender.com/</a>
          </li>
          <li>
            <strong>Email Form:</strong>
            <a href="/index.jsp">https://chap13-1.onrender.com/index.jsp</a>
          </li>
          <li>
            <strong>Email Servlet:</strong>
            <a href="/emailList">https://chap13-1.onrender.com/emailList</a>
          </li>
          <li>
            <strong>Test Page:</strong>
            <a href="/test.jsp">https://chap13-1.onrender.com/test.jsp</a>
          </li>
        </ul>
      </div>

      <div class="status warning">
        <h3>⚠️ Known Issues</h3>
        <p>
          <strong>/emailList → 404:</strong> Servlet chỉ accepts POST method
        </p>
        <p>
          <strong>Solution:</strong> Truy cập form từ
          <a href="/index.jsp">index.jsp</a> và submit form
        </p>
      </div>

      <div class="status info">
        <h3>🔍 Debug Information</h3>
        <div class="code">
          Context Path: <%= request.getContextPath() %><br />
          Servlet Path: <%= request.getServletPath() %><br />
          Request URI: <%= request.getRequestURI() %><br />
          Server Name: <%= request.getServerName() %><br />
          Server Port: <%= request.getServerPort() %><br />
          Remote Host: <%= request.getRemoteHost() %>
        </div>
      </div>

      <div class="status success">
        <h3>📋 Next Steps</h3>
        <ol>
          <li>
            Click <a href="/index.jsp"><strong>Email Form</strong></a> để test
            ứng dụng
          </li>
          <li>Điền thông tin và submit form</li>
          <li>Kiểm tra database có nhận được dữ liệu mới</li>
          <li>Verify thanh you page hiển thị đúng</li>
        </ol>
      </div>

      <div class="status info">
        <h3>🛠️ Technical Details</h3>
        <p><strong>Framework:</strong> Jakarta EE 8 + Hibernate JPA</p>
        <p><strong>Database:</strong> Google Cloud SQL MySQL</p>
        <p><strong>Deployment:</strong> Docker on Render</p>
        <p><strong>Build:</strong> Maven multi-stage Docker build</p>
      </div>

      <hr style="margin: 30px 0" />
      <p style="text-align: center; color: #666">
        🎉 <strong>Email List Application</strong> - Successfully deployed on
        Render!
      </p>
    </div>
  </body>
</html>
