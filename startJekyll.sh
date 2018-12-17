echo Starting...
cd src
mkdir _site &>/dev/null
mkdir _site/libs &>/dev/null
echo "" > _site/libs/style.css
bundle exec jekyll build --incremental
bundle exec jekyll serve --incremental
cd ..