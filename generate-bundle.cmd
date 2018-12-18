rem Isso é necessário quando se altera o arquivo style.scss, pois ele é agrupado no bundle-begin.css e ainda não existe nesse momento.
echo Generating...
cd src
mkdir _site 
mkdir _site\libs
echo "" > _site\libs/style.css
call bundle exec jekyll build --future --limit_posts 1
cd ..
echo Done.