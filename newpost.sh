#!bin/bash

echo "포스트 제목을 입력하세요: "
read title

t_title=$(echo $title | sed "s/ /-/g")
date=`date +%Y-%m-%d`

echo "---\ntitle: \"$title\"\nexcerpt: \"Enter excerpt\"\n\ncategories:\n  - Enter category\ntags:\n  - [Add, Tags]\n\ndate: $date\n---\n\n" > ./_posts/$date-$t_title.md
