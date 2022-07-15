#!bin/bash

echo "포스트 제목을 입력하세요: "
read title
echo "포스트 한 줄 요약을 입력하세요: "
read excerpt
echo "카테고리를 입력하세요: "
read category

t_title=$(echo $title | sed "s/ /-/g")
date=`date +%Y-%m-%d`

echo "---\ntitle: \"$title\"\nexcerpt: \"$excerpt\"\n\ncategories:\n  - $category\ntags:\n  - [Add, Tags]\n\ndate: $date\n---\n\n" > ./_posts/$date-$t_title.md
