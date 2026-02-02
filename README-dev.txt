USAGreenland.com — Local Development Notes
=========================================

PROJECT ROOT
------------
C:\Users\bain7\OneDrive\Desktop\USA GREENLAN SITE FILES

IMPORTANT
---------
• Always run the server FROM THE PROJECT ROOT
• Do NOT open .html files directly (file://)
• Always view pages through the local server (http://localhost)

--------------------------------------------
COMMON POWERSHELL COMMANDS
--------------------------------------------

1) Go to project root
----------------------
cd "$env:USERPROFILE\OneDrive\Desktop\USA GREENLAN SITE FILES"


2) Start local server (static site)
-----------------------------------
npx http-server . -p 5500


3) Open site in browser
-----------------------
http://localhost:5500

Example article URLs:
http://localhost:5500/articles/first-briefing.html
http://localhost:5500/articles/us-greenland-business-outlook.html


4) Stop the server
------------------
CTRL + C   (in the PowerShell window running the server)

5) Go to backend/store:
cd "$env:USERPROFILE\OneDrive\Desktop\USA GREENLAN SITE FILES\backend\store"

NOTES
-----
• Live changes appear when you refresh the browser
• 404 for favicon.ico is normal until one is added
• Backend Canonical Store (SQLite) runs separately and
  does NOT affect front-end rendering yet
