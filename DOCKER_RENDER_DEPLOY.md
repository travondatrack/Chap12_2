# 🚀 RENDER DEPLOYMENT GUIDE - DOCKER

## 📋 **PREREQUISITES:**

### ✅ **Files cần thiết (ĐÃ CÓ):**

- ✅ `Dockerfile` - Multi-stage build với Maven & Tomcat
- ✅ `render.yaml` - Render deployment config
- ✅ `.dockerignore` - Optimize build
- ✅ `pom.xml` - Maven dependencies
- ✅ Source code trong `src/`

## 🐳 **DOCKERFILE EXPLAINED:**

```dockerfile
# Stage 1: Build với Maven
FROM maven:3.9.4-eclipse-temurin-21 AS builder
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline -B    # Download dependencies
COPY src ./src
RUN mvn clean package -DskipTests   # Build WAR file

# Stage 2: Production với Tomcat
FROM tomcat:10.1-jdk21-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /app/target/Chap13_1-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
```

**Benefits:**

- ✅ Multi-stage: Smaller final image (~250MB vs 1GB+)
- ✅ Cached layers: Faster rebuilds
- ✅ Production-ready: Only runtime dependencies

## 📝 **RENDER.YAML CONFIG:**

```yaml
services:
  - type: web
    name: chap13-1
    env: docker # Use Docker
    dockerfilePath: ./Dockerfile # Path to Dockerfile
    plan: free # Free tier
    healthCheckPath: / # Check root URL
    autoDeploy: true # Auto-deploy on push

    envVars: # No database needed!
      - key: JAVA_OPTS
        value: "-Xmx512m -Xms256m -Djava.awt.headless=true"
      - key: CATALINA_OPTS
        value: "-Djava.security.egd=file:/dev/./urandom"
```

## 🚀 **DEPLOYMENT STEPS:**

### **Step 1: Push Code to GitHub**

```bash
# In VS Code or NetBeans
1. Commit all changes
2. Push to GitHub repository
```

### **Step 2: Connect to Render**

1. Go to https://dashboard.render.com
2. Click **"New +"** → **"Web Service"**
3. Connect your GitHub repository
4. Select the repository

### **Step 3: Configure Service**

Render will auto-detect `render.yaml` and use those settings:

- ✅ **Name:** chap13-1
- ✅ **Environment:** Docker
- ✅ **Dockerfile:** ./Dockerfile
- ✅ **Plan:** Free

Click **"Create Web Service"**

### **Step 4: Wait for Build**

Render will:

1. ⏳ Clone repository from GitHub
2. ⏳ Build Docker image (Stage 1: Maven build)
3. ⏳ Create production image (Stage 2: Tomcat)
4. ⏳ Deploy container
5. ✅ **Your service is live!**

**Time:** ~5-7 minutes for first build

### **Step 5: Verify Deployment**

Check logs for:

```
==> Building...
==> Successfully built image
==> Deploying...
==> Your service is live 🎉
==> Available at: https://chap13-1.onrender.com
```

## 🧪 **TESTING:**

### **Test 1: Home Page**

```
https://chap13-1.onrender.com/
```

Expected: Redirect to index.jsp

### **Test 2: Email Form**

```
https://chap13-1.onrender.com/index.jsp
```

Expected: Form hiển thị

### **Test 3: Servlet Endpoint**

```
https://chap13-1.onrender.com/emailList
```

Expected: Forward to index.jsp (no 404!)

### **Test 4: Complete Workflow**

1. Open: https://chap13-1.onrender.com/index.jsp
2. Fill form:
   - Email: test@example.com
   - First Name: Test
   - Last Name: User
3. Submit
4. Expected: Thanks page with user data

## 📊 **MONITORING:**

### **Render Dashboard:**

- **Logs:** Real-time application logs
- **Metrics:** CPU, Memory usage
- **Events:** Deployment history
- **Settings:** Environment variables

### **Check Logs:**

```
Dashboard → Service → Logs tab
```

Look for:

```
✓ Tomcat started successfully
✓ Server startup in [xxx] milliseconds
✓ Deployment of web application archive [ROOT.war] has finished
```

## 🔄 **AUTO-DEPLOY:**

Render auto-deploys when you push to GitHub:

```bash
# Make changes
# Commit: git commit -m "Update servlet"
# Push: git push origin main
# → Render automatically rebuilds and redeploys!
```

## 🐛 **TROUBLESHOOTING:**

### **Build Failed:**

```
Error: Maven build failed
```

**Fix:** Check `pom.xml` dependencies, ensure Java 21 compatibility

### **Container Crashes:**

```
Error: Container exited with code 137
```

**Fix:** Out of memory - adjust JAVA_OPTS in render.yaml

### **404 Errors:**

```
Error: Resource not available
```

**Fix:** Check servlet package and annotation, verify WAR structure in logs

### **Slow First Load:**

```
Warning: Service takes long to respond
```

**Normal:** Free tier spins down after inactivity, takes ~30s to wake up

## 💡 **OPTIMIZATION TIPS:**

### **1. Faster Builds:**

- Use `.dockerignore` to exclude unnecessary files
- Maven dependencies are cached

### **2. Smaller Image:**

- Multi-stage build already optimized
- Final image only contains Tomcat + WAR

### **3. Better Performance:**

- Adjust JAVA_OPTS for your needs
- Use paid plan for always-on service

## 📦 **DOCKERFILE BEST PRACTICES:**

### ✅ **Current Implementation:**

```dockerfile
# Layer caching
COPY pom.xml .                    # Copy only POM first
RUN mvn dependency:go-offline     # Download deps (cached!)
COPY src ./src                    # Then copy source

# Multi-stage
FROM maven AS builder             # Build stage
FROM tomcat AS runtime            # Production stage

# Clean deployment
RUN rm -rf /usr/local/tomcat/webapps/*    # Remove defaults
COPY --from=builder ... ROOT.war           # Deploy as ROOT
```

## 🎯 **SUCCESS CRITERIA:**

- ✅ Build completes without errors
- ✅ Tomcat starts successfully
- ✅ WAR deploys to ROOT context
- ✅ Application accessible via URL
- ✅ Servlet responds to requests
- ✅ Form submission works
- ✅ Thanks page displays data

## 📋 **FINAL CHECKLIST:**

- [ ] Code pushed to GitHub
- [ ] Render service created
- [ ] Build completed successfully
- [ ] Service is live
- [ ] Home page accessible
- [ ] Servlet endpoint works (no 404)
- [ ] Form submission successful
- [ ] Thanks page displays correctly
- [ ] Logs show no errors

## 🚀 **DEPLOYMENT COMPLETE!**

Your application is now live at:

```
https://chap13-1.onrender.com
```

**Key Features:**

- ✅ Docker containerized
- ✅ Multi-stage optimized build
- ✅ Auto-deploy from GitHub
- ✅ Free tier hosting
- ✅ Production-ready Tomcat
- ✅ No database required
- ✅ Simple servlet workflow

**Next Steps:**

- Test all functionality
- Monitor logs for issues
- Add features as needed
- Scale up if traffic grows

🎉 **Happy Deploying!** 🎉
