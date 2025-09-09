@echo PUBLISHING

@cd src
@echo GENERATING BUNDLE...
@echo "" > _site\libs\style.css
call bundle exec jekyll build --future --limit_posts 1

@echo BUILDING jekyll...
@call bundle exec jekyll build 

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