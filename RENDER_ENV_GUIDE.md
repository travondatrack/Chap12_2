# 🔧 ENVIRONMENT VARIABLES TRONG RENDER

## 📋 Danh sách Environment Variables cần thiết

### 🗂️ Database Configuration

```
Key: DB_HOST
Value: 34.9.114.182
Type: Plain Text
```

```
Key: DB_PORT
Value: 3306
Type: Plain Text
```

```
Key: DB_NAME
Value: murach
Type: Plain Text
```

```
Key: DB_USER
Value: root
Type: Plain Text
```

```
Key: DB_PASSWORD
Value: Spk61392005@
Type: Secret (⚠️ QUAN TRỌNG - chọn Secret để ẩn giá trị)
```

### 🚀 Application Configuration

```
Key: JAVA_OPTS
Value: -Xmx512m -Xms256m -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true
Type: Plain Text
```

```
Key: CATALINA_OPTS
Value: -Djava.security.egd=file:/dev/./urandom
Type: Plain Text
```

```
Key: APP_ENV
Value: production
Type: Plain Text
```

```
Key: LOG_LEVEL
Value: INFO
Type: Plain Text
```

### 🔗 Connection Pool Settings

```
Key: HIKARI_MAX_POOL_SIZE
Value: 5
Type: Plain Text
```

```
Key: HIKARI_MIN_IDLE
Value: 1
Type: Plain Text
```

```
Key: HIKARI_CONNECTION_TIMEOUT
Value: 20000
Type: Plain Text
```

```
Key: HIKARI_IDLE_TIMEOUT
Value: 300000
Type: Plain Text
```

## 🖥️ CÁCH THÊM TRONG RENDER DASHBOARD

### Bước 1: Truy cập Service Settings

1. Đăng nhập **Render Dashboard**
2. Chọn **Web Service** của bạn
3. Click tab **"Environment"** bên trái

### Bước 2: Thêm Environment Variables

1. Click **"Add Environment Variable"**
2. Nhập **Key** và **Value**
3. Chọn **Type**:
   - **Plain Text**: Hiển thị giá trị (cho non-sensitive data)
   - **Secret**: Ẩn giá trị (cho passwords, keys)

### Bước 3: Save và Deploy

1. Click **"Save Changes"**
2. Render sẽ tự động **redeploy** service
3. Kiểm tra logs để confirm

## 🔒 BẢO MẬT QUAN TRỌNG

### ⚠️ Luôn đặt làm SECRET:

- `DB_PASSWORD` ← **BẮT BUỘC SECRET**
- Bất kỳ API keys, tokens
- Encryption keys

### ✅ Có thể dùng Plain Text:

- `DB_HOST`, `DB_PORT`, `DB_NAME`
- `JAVA_OPTS`, `APP_ENV`
- Configuration settings

## 📸 RENDER DASHBOARD WORKFLOW

### Environment Tab sẽ trông như này:

```
🔧 Environment Variables

✅ DB_HOST              34.9.114.182           [Plain Text]
✅ DB_PORT              3306                   [Plain Text]
✅ DB_NAME              murach                 [Plain Text]
✅ DB_USER              root                   [Plain Text]
✅ DB_PASSWORD          ••••••••••••••         [Secret] 🔒
✅ JAVA_OPTS            -Xmx512m -Xms256m...   [Plain Text]
✅ CATALINA_OPTS        -Djava.security...     [Plain Text]
✅ APP_ENV              production             [Plain Text]
✅ LOG_LEVEL            INFO                   [Plain Text]

[+ Add Environment Variable]
```

## 🚀 QUICK SETUP SCRIPT

Copy-paste từng dòng này vào Render:

```bash
# === DATABASE ===
DB_HOST=34.9.114.182
DB_PORT=3306
DB_NAME=murach
DB_USER=root
DB_PASSWORD=Spk61392005@          # ← Set as SECRET

# === APPLICATION ===
JAVA_OPTS=-Xmx512m -Xms256m -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true
CATALINA_OPTS=-Djava.security.egd=file:/dev/./urandom
APP_ENV=production
LOG_LEVEL=INFO

# === CONNECTION POOL ===
HIKARI_MAX_POOL_SIZE=5
HIKARI_MIN_IDLE=1
HIKARI_CONNECTION_TIMEOUT=20000
HIKARI_IDLE_TIMEOUT=300000
```

## 🔍 KIỂM TRA ENVIRONMENT VARIABLES

### Trong Application Logs

Sau khi deploy, check logs để confirm:

```
=== Database Configuration ===
Environment: production
DB Host: 34.9.114.182
DB Port: 3306
DB Name: murach
DB User: root
Show SQL: false
=============================
```

### Test Connection

Application sẽ log khi start:

```
✓ Kết nối database thành công!
✓ Database hiện tại: murach
✓ Bảng users đã được tạo/kiểm tra thành công!
```

## ⚡ RENDER AUTO-FEATURES

### 🔄 Auto Redeploy

- Khi thay đổi Environment Variables
- Render tự động redeploy service
- Không cần manual trigger

### 📊 Environment History

- Render lưu lịch sử thay đổi
- Có thể rollback nếu cần
- View changes trong dashboard

### 🔐 Secret Management

- Secret values được encrypt
- Không hiển thị trong logs
- Team members không thấy được values

## 🚨 TROUBLESHOOTING

### Application không start

```bash
# Check logs để xem:
1. Environment variables được load đúng không
2. Database connection có thành công không
3. Có missing variables nào không
```

### Database connection failed

```bash
# Kiểm tra:
1. DB_HOST, DB_PORT đúng chưa
2. DB_PASSWORD có chính xác không (check trong Secret)
3. Google Cloud SQL có allow external connections không
```

### Performance issues

```bash
# Điều chỉnh:
1. JAVA_OPTS memory settings
2. HIKARI connection pool size
3. LOG_LEVEL từ DEBUG về INFO
```

## 📝 CHECKLIST

### Before Deploy:

- [ ] Tất cả environment variables đã được set
- [ ] DB_PASSWORD được set as Secret
- [ ] JAVA_OPTS phù hợp với Render plan
- [ ] APP_ENV = production

### After Deploy:

- [ ] Check deployment logs successful
- [ ] Application accessible via URL
- [ ] Database connection working
- [ ] Form submission test passed
- [ ] No errors in application logs

## 💡 PRO TIPS

### 1. Environment Template

Tạo file `.env.render` local để backup:

```bash
# Copy content này vào notepad
# Dùng làm reference khi setup Render
```

### 2. Staging Environment

Tạo separate service cho testing:

```bash
APP_ENV=staging
LOG_LEVEL=DEBUG
DB_NAME=murach_staging  # Nếu có staging database
```

### 3. Quick Access

Bookmark Render Environment page:

```
https://dashboard.render.com/web/[YOUR-SERVICE-ID]/env
```
