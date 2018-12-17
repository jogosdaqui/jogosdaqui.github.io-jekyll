# Isso é necessário quando se altera o arquivo style.scss, pois ele é agrupado no bundle-begin.css e ainda não existe nesse momento.
echo Generating...
cd src
mkdir _site &>/dev/null
mkdir _site/libs &>/dev/null
echo "" > _site/libs/style.css
bundle exec jekyll build --future --limit_posts 1 >/dev/null
cd ..
echo Done.