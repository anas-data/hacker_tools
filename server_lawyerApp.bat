@echo off

:: ضبط المنفذ
set PORT=3000
:: الرمز الخاص بك
set TOKEN=2kdr4u1M5CaNLF4nSseFk6IMcn2_t1878yawucACQ8jsbiaY

echo [1/3] Setting up ngrok auth token...
ngrok config add-authtoken %TOKEN%

echo [2/3] Starting local server on port %PORT%...
:: محاولة تشغيل السيرفر باستخدام 'python' أو 'py' لضمان العمل على أغلب الأنظمة
start "Python Server" cmd /k "python -m http.server %PORT% || py -m http.server %PORT%"

echo Waiting for server to initialize (5 seconds )...
timeout /t 5

echo [3/3] Starting ngrok tunnel to localhost:%PORT%...
:: استخدام localhost يضمن الوصول للسيرفر حتى لو تغير IP الجهاز
ngrok http %PORT%

pause
