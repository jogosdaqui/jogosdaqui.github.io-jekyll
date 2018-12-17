echo Starting...
cd src
mkdir _site &>/dev/null
mkdir _site/libs &>/dev/null
echo "" > _site/libs/style.css
bundle exec jekyll build --future --limit_posts 1 >/dev/null
bundle exec jekyll serve --incremental --future --limit_posts 1
cd ..