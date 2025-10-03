# Email List Application

This is a Jakarta EE 8 web application that demonstrates JPA (Java Persistence API) with Hibernate and MySQL for managing an email list.

## Features

- Email list signup form
- JPA entities with Hibernate
- MySQL database integration
- Servlet-based web interface
- Responsive CSS styling

## Prerequisites

- Java 8 or higher
- Apache Maven 3.6+
- MySQL 8.0+
- Jakarta EE 8 compatible application server (e.g., Apache Tomcat 9+, WildFly, GlassFish)

## Database Setup

### Google Cloud SQL Configuration

This application is configured to connect to your Google Cloud SQL MySQL instance:

- **Instance Connection Name**: `onyx-window-472603-n2:us-central1:murach-db`
- **Public IP**: `34.9.114.182`
- **Port**: `3306`
- **Database**: `murach`
- **Username**: `root`
- **Password**: `Spk61392005@`

### Setup Steps

1. **Ensure your Google Cloud SQL instance is running** and accessible
2. **Run the database setup script** in your Google Cloud SQL console or MySQL client:

   ```sql
   -- Connect to your Google Cloud SQL instance and run:
   USE murach;

   CREATE TABLE IF NOT EXISTS users (
       userId BIGINT NOT NULL AUTO_INCREMENT,
       email VARCHAR(255) NOT NULL UNIQUE,
       firstName VARCHAR(100) NOT NULL,
       lastName VARCHAR(100) NOT NULL,
       PRIMARY KEY (userId)
   );
   ```

3. **Verify the connection** - The application is configured with:
   - SSL enabled for secure connection
   - HikariCP connection pooling for better performance
   - Automatic table creation/updates via Hibernate

### Connection Details in persistence.xml

The application connects using:

- **JDBC URL**: `jdbc:mysql://34.9.114.182:3306/murach?useSSL=true&allowPublicKeyRetrieval=true&serverTimezone=UTC`
- **SSL**: Enabled for secure connection
- **Connection Pool**: HikariCP with optimized settings for cloud database

## Build and Deploy

### 🛡️ DATA PROTECTION (BẢO VỆ DỮ LIỆU)

**Application được cấu hình để BẢO VỆ dữ liệu khỏi bị reset khi deploy:**

- ✅ `hibernate.hbm2ddl.auto = validate` - CHỈ kiểm tra, KHÔNG thay đổi database
- ✅ Dữ liệu hiện tại sẽ được GIỮ NGUYÊN khi redeploy
- ✅ An toàn để deploy nhiều lần

### Build Steps

1. Build the project:

   ```bash
   mvn clean compile package
   ```

2. Deploy the generated WAR file (`target/Chap13_1-1.0-SNAPSHOT.war`) to your application server

3. Access the application at: `http://localhost:8080/Chap13_1-1.0-SNAPSHOT/`

**⚠️ Lưu ý:** Nếu thay đổi cấu trúc bảng trong code, cần cập nhật thủ công trong database.

## Project Structure

```
src/main/java/
├── murach/
│   ├── business/
│   │   └── User.java              # JPA Entity
│   ├── data/
│   │   ├── DBUtil.java            # Database utility
│   │   └── UserDB.java            # Data access layer
│   └── email/
│       └── EmailListServlet.java  # Main servlet
└── com/mycompany/chap13_1/         # Original Jakarta REST files

src/main/webapp/
├── index.jsp                       # Email signup form
├── thanks.jsp                      # Thank you page
└── styles/main.css                 # CSS styling

src/main/resources/META-INF/
└── persistence.xml                 # JPA configuration
```

## Usage

1. Navigate to the application URL
2. Fill out the email signup form with:
   - Email address
   - First name
   - Last name
3. Submit the form
4. View confirmation on the thank you page
5. Check the MySQL database to see the stored user data

## Notes

- The application uses Hibernate for JPA implementation
- The `emailListPU` persistence unit is configured for the email list functionality
- The original Jakarta REST configuration is preserved in the `com.mycompany.chap13_1` package
- Error messages will appear if you try to register with an email that already exists
