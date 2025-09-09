@echo PUBLISHING

@cd src 
@copy ..\CNAME _site\CNAME
@echo ".nojekyll" > _site\.nojekyll

@echo GENERATING VERSION.JSON...
@cd _site
@echo off
for /f "delims=" %%a in ('powershell -Command "Get-Date -Format g"') do set DATE=%%a
@echo { "date": "%DATE%", "branch": "" } > version.json


@echo COMMITING AND PUSHING...
@git add .
@git commit -m "Site update"
@git push

@echo DONE.