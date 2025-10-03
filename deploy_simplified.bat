@echo off
echo ============================================
echo DEPLOYING SIMPLIFIED VERSION (NO DATABASE)
echo ============================================
echo.
echo Changes to deploy:
echo 1. EmailListServlet - Simplified (no database)
echo 2. index.jsp - Simple form (no User object)
echo 3. thanks.jsp - Direct attributes display
echo 4. Deleted murach package (database code)
echo 5. Updated render.yaml (no database env vars)
echo.

echo Checking current status...
git status

echo.
echo ============================================
echo READY TO COMMIT?
echo ============================================
echo.
echo This will:
echo - Stage ALL changes
echo - Commit with message
echo - Push to GitHub
echo - Trigger Render deployment
echo.
pause

echo.
echo Adding all changes...
git add .

echo.
echo Committing...
git commit -m "Simplify app: Remove database, direct form to thanks page workflow"

echo.
echo Pushing to GitHub...
git push origin main

echo.
echo ============================================
echo DEPLOYMENT TRIGGERED!
echo ============================================
echo.
echo Render is now deploying the simplified version:
echo - No database code
echo - Simple servlet workflow
echo - Form -> Servlet -> Thanks page
echo.
echo Wait 5-7 minutes then test:
echo https://chap13-1.onrender.com/index.jsp
echo.
echo Fill form and submit - should go to thanks.jsp!
echo.
pause
